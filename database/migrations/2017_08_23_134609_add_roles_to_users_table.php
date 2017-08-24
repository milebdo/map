<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddRolesToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       Schema::table('users', function($table)
       {
           $table->longText('coordinate')->nullable();
           $table->string('roles')->nullable();
           $table->integer('zoom')->nullable();
       });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function($table)
        {
            $table->dropColumn('coordinate');
            $table->dropColumn('roles');
            $table->dropColumn('zoom');
        });
    }
}
