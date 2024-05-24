<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stream_disputes', function (Blueprint $table) {
            
            $table->id();
            $table->unsignedBigInteger('stream_id');
            $table->string('name');
            $table->string('email');
            $table->string('mobile');
            $table->text('remark')->nullable();
            $table->timestamps();

            // Define foreign key constraint for the stream_id column
            $table->foreign('stream_id')->references('id')->on('livestreams');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stream_disputes');
    }
};
