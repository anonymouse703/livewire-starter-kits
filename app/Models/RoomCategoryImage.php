<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomCategoryImage extends Model
{
    use HasFactory;

    protected $table = 'tb_room_category_images';

    protected $fillable = ['room_category_id','image_name'];
}
