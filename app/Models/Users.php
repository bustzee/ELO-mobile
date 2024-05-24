<?php

namespace App\Models;

use App\Trait\HasPermissionsTrait;
use Filament\Models\Contracts\FilamentUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;
class Users extends Authenticatable implements JWTSubject
{
    use HasFactory, HasApiTokens, Notifiable;
    use  HasPermissionsTrait;

    protected $guarded = [];

    public $appends = ['imageLink','name'];


    // this function will make image_link column for the fetching
    public function getimageLinkAttribute()
    {

        if ($this->profile && file_exists(public_path('images/' . $this->profile))) {
            return url('images/' . $this->profile);
        }
        return 'https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg';
    }

    // this users has many live streasm  users details
    public function livestreams()
    {
        return $this->hasMany(UserLivestreams::class, 'user_id');
    }

    // this function will show the numer of livestreams
    public function streams(){
        return $this->hasMany(Livestream::class,'user_id','id');
    }
    // public function getavatarsAttribute()
    // {
    //     return $this->livestreamAvatar->avatar_image ?? '';
    // }
   
// this function will creaete a column name
    public function getnameAttribute()
    {
        return $this->username;
    }

    // public function getavatarsAttribute()
    // {
    //     return $this->imageLink;
    // }

    public function canAccessFilament(): bool
    {
        return $this->email == 'admin@gmail.com';
    }
    // this function will shows all the livestream that this user can monitor
    public function canmonitor(){
        return $this->belongsToMany(Livestream::class,'livestream_monitor');
    }
    public function startStream(){
        return $this->canmonitor()->where('status','started');
    }
   
    public function likeLivestream(Livestream $livestream)
    {
        // Check if the user has liked the livestream
        $like = LivestreamLike::where('user_id', $this->id)
                              ->where('livestream_id', $livestream->id)
                              ->first();


        if(!empty($like) && $like->type == "unlike"){
            $like->delete();
            LivestreamLike::create([
                'user_id' => $this->id,
                'livestream_id' => $livestream->id,
                'type' => 'like', // Set type to 'unlike'
            ]);
        }else {
            LivestreamLike::create([
                'user_id' => $this->id,
                'livestream_id' => $livestream->id,
                'type' => 'like', // Set type to 'unlike'
            ]);
        }
    }

    public function unlikeLivestream(Livestream $livestream)
    {
        // Check if the user has liked the livestream
        $unlike = LivestreamLike::where('user_id', $this->id)
                              ->where('livestream_id', $livestream->id)
                              ->first();


        if(!empty($unlike) && $unlike->type == "like"){
            $unlike->delete();
            LivestreamLike::create([
                'user_id' => $this->id,
                'livestream_id' => $livestream->id,
                'type' => 'unlike', // Set type to 'unlike'
            ]);
        }else {
            LivestreamLike::create([
                'user_id' => $this->id,
                'livestream_id' => $livestream->id,
                'type' => 'unlike', // Set type to 'unlike'
            ]);
        }

            
    }

    public function hasLikedLivestream($livestream)
    {
        // Check if the user has liked the specified livestream
        return LivestreamLike::where('user_id', $this->id)
                             ->where('livestream_id', $livestream->id)
                             ->where('type', 'like')
                             ->exists();
    }

    
    public function hasUnlikedLivestream($livestream)
    {
        // Check if the user has unliked the specified livestream
        return LivestreamLike::where('user_id', $this->id)
                             ->where('livestream_id', $livestream->id)
                             ->where('type', 'unlike')
                             ->exists();
    }

       /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
    
     protected $hidden = [
        'password',
        // Add other fields you want to hide
    ];


}
