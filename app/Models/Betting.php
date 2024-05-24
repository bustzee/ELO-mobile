<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Betting extends Model
{
    use HasFactory;

    protected $guarded = [];
	// public $timestamps = false;  if not save date and time 
    protected $table='betting_master';
    protected $fillable =[
        'id',
        'betting_amount',
        'ia_active',
        'description',
        'added_by',
        'created_at',
        'updated_at'
    ];
   
}
