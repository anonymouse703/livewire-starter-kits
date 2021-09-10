<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomCategory extends Model
{
    use HasFactory;

    protected $table = 'tb_room_categories';

    protected $fillable = ['name','description','base_price'];

    public function images()
  {
      return $this->hasMany(RoomCategoryImage::class,'room_category_id','id');
  }
}
