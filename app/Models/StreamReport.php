<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StreamReport extends Model
{
    use HasFactory;
    protected $table = 'stream_reports';

    protected $guarded = [];
}
