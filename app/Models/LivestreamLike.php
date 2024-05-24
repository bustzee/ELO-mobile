<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LivestreamLike extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'livestream_id','type'];
    
    // Define relationship with the User model
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    // Define relationship with the Livestream model
    public function livestream()
    {
        return $this->belongsTo(Livestream::class);
    }
    
}
