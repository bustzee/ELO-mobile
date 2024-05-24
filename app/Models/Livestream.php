<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use DB;
class Livestream extends Model
{
    use HasFactory;

    protected $guarded = [];

    // user
    public function user(): BelongsTo
    {
        return $this->belongsTo(Users::class, 'user_id');
    }

    protected $fillable = [
        'user_id',
        'stream_id',
        'name',
        'image',
        'status',
        'description',
        'delay_time',
        'view_counter',
        'type'
    ];
    public $appends = ['fileLink'];
    // comments
    public function comments(): HasMany
    {
        return $this->hasMany(Comment::class);
    }

    // this live streams has many cahts
    public function chats()
    {
        return $this->hasMany(Chat::class, 'livestreams_id');
    }

    public function getFileLinkAttribute()
    {
        $url ="http://".config('app.ip_address')."/'.$this->stream_id.'.mp4";
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_NOBODY, true);
        curl_exec($ch);
        $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($code == 200) {
            $status = true;
        } else {
            $status = false;
        }
        curl_close($ch);
        return $status;
    }

    // this function will show the livestream that  who can monitor this livestream
    public function whomonitor()
    {
        return $this->belongsToMany(Users::class, 'livestream_monitor');
    }
    // this function will fetch the total viewer of this live streams
    public function viewer()
    {
        return $this->belongsToMany(Users::class, 'livestream_count');
    }
    // this function will shows the number of bets has many bets
    public function bets()
    {
        return $this->hasMany(Bet::class, 'game_id', 'id');
    }
    // this function tell that this livestreams has many bet main
    public function betMain()
    {
        return $this->hasMany(BetMain::class, 'livestream_id', 'id');
    }

    public function likes()
    {
        return $this->hasMany(LivestreamLike::class)->where('type', 'like');
    }

    public function unlikes()
    {
        return $this->hasMany(LivestreamLike::class)->where('type', 'unlike');
    }

    public function likeCount()
    {
        return $this->likes()->count();
    }

    public function unlikeCount()
    {
        return $this->unlikes()->count();
    }

    public function scopeWhereDoesntHaveReports($query)
    {
        return $query->whereNotExists(function ($subquery) {
            $subquery->select(DB::raw(1))
                ->from('stream_reports')
                ->whereRaw('stream_reports.stream_id = livestreams.id');
        });
    }
    

    public function hasPlatformViolations()
    {
        // Example logic to check for violations (customize based on your requirements)
        if ($this->status === 'stopped' || $this->status === 'banned') {
            return true; // Livestream has violations
        }

        return false; // Livestream does not have violations
    }

    /**
     * Get the like count for the livestream.
     *
     * This method should return the like count for the livestream.
     *
     * @return int
     */
    public function getLikeCount()
    {
        // Example logic to fetch and return the like count (customize based on your implementation)
        return $this->likes()->count(); // Assuming you have a relationship named 'likes'
    }

    /**
     * Get the pot amount for the livestream.
     *
     * This method should return the pot amount for the livestream.
     *
     * @return float
     */
    // public function getPotAmount()
    // {
    //     // Example logic to fetch and return the pot amount (customize based on your implementation)
    //     return $this->bets()->sum('total_amount'); // Assuming you have a relationship named 'bets'
    // }

    // Define relationships (if not already defined)
    // public function likes()
    // {
    //     return $this->hasMany(LivestreamLike::class); // Assuming 'LivestreamLike' is your like model
    // }

    // public function bets()
    // {
    //     return $this->hasMany(Bet::class); // Assuming 'Bet' is your bet model
    // }

    public function getPotAmount()
    {
        return $this->bets()->sum('amount'); 
    }
}
