<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;

    protected $table = 'tb_clients';

    protected $fillable = ['firstname','middlename','lastname','suffix','email','contact_number','birthdate',
    'nationality','gender','street','barangay','city','province','status','nationality','user'];

}
