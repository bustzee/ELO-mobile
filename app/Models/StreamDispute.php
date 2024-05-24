<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StreamDispute extends Model
{
    use HasFactory;
    protected $table = 'stream_disputes';

    protected $guarded = [];

    public function livestream(){
        return $this->belongsTo(Livestream::class,'stream_id','id');
    }

    public function user(){
        return $this->belongsTo(Users::class,'user_id','id');
    }

    public function bet(){
        return $this->belongsTo(Bet::class,'bet_id','id');
    }

}
