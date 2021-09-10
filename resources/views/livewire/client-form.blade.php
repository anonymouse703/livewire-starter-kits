<div>
    <div class="modal-content">
        <form wire:submit.prevent="store" enctype="multipart/form-data">
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">Add Client Profile</h4>
            <a type="button" class="close" data-dismiss="modal">&times;</a>
            </div>
            
            <!-- Modal body -->
            <div class=" modal-body">
                <div class="form-group">
                    <label>Last Name</label>
                    <input  type="text"  wire:model.defer="lastname" name="lastname" class="form-control"  required>
                    @if($errors->has('lastname'))
                    <p style="color:red">{{$errors->first('lastname')}}</p>
                    @endif
                </div>   
                <div class="form-group">
                    <label>Middle Name</label>
                    <input  type="text"  wire:model.defer="middlename" name="middlename" class="form-control"  required>
                    @if($errors->has('middlename'))
                    <p style="color:red">{{$errors->first('middlename')}}</p>
                    @endif
                </div> 
                <div class="form-group">
                    <label>First Name</label>
                    <input  type="text"  wire:model.defer="firstname" name="firstname" class="form-control"   required>
                    @if($errors->has('firstname'))
                    <p style="color:red">{{$errors->first('firstname')}}</p>
                    @endif
                </div> 
                <div class="form-group">
                    <label>Suffix</label>
                    <input  type="text"  wire:model.defer="suffix" name="suffix" class="form-control" style="width:20%">
                    @if($errors->has('suffix'))
                    <p style="color:red">{{$errors->first('suffix')}}</p>
                    @endif
                </div> 
                <div class="form-group">
                    <label>Email</label>
                    <input  type="text"  wire:model.defer="email" name="email" class="form-control"  required>
                    @if($errors->has('email'))
                    <p style="color:red">{{$errors->first('email')}}</p>
                    @endif
                </div> 
                <div class="form-group">
                    <label>Contact contact_number</label>
                    <input  type="text"  wire:model.defer="contact_number" name="contact_number" class="form-control"  required>
                    @if($errors->has('contact_number'))
                    <p style="color:red">{{$errors->first('contact_number')}}</p>
                    @endif
                </div> 
                <div class="form-group">
                    <label>Nationality</label>
                    <input  type="text"  wire:model.defer="nationality" name="nationality" class="form-control"  required>
                    @if($errors->has('nationality'))
                    <p style="color:red">{{$errors->first('nationality')}}</p>
                    @endif
                </div> 
                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender" wire:model="gender" class="form-control">
                        <option value=''>Choose A Gender</option>
                        @foreach($genders as $gender)
                            <option value="{{$gender->id}}">{{$gender->name}}</option>
                        @endforeach
                    </select>
                    @if($errors->has('gender'))
                    <p style="color:red">{{$errors->first('gender')}}</p>
                    @endif
                </div>    
                <div class="form-group">
                    <label>Street</label>
                    <input  type="text" wire:model.defer="street" name="street" class="form-control" required>
                    @if($errors->has('street'))
                    <p style="color:red">{{$errors->first('street')}}</p>
                    @endif
                </div>   
                <div class="form-group">
                    <label>Barangay <Address></Address></label>
                    <input  type="text" wire:model.defer="barangay" name="barangay" class="form-control" required>
                    @if($errors->has('barangay'))
                    <p style="color:red">{{$errors->first('barangay')}}</p>
                    @endif
                </div>    
                <div class="form-group">
                    <label>City</label>
                    <input  type="text" wire:model.defer="city" name="city" class="form-control" required>
                    @if($errors->has('city'))
                    <p style="color:red">{{$errors->first('city')}}</p>
                    @endif
                </div>    
                <div class="form-group">
                    <label>Province</label>
                    <input  type="text" wire:model.defer="province" name="province" class="form-control" required>
                    @if($errors->has('province'))
                    <p style="color:red">{{$errors->first('province')}}</p>
                    @endif
                </div> 
                <div class="form-group">
                    <label>Date of Birth</label>
                    <input  type="date" wire:model="birthdate" name="birthdate" class="form-control" placeholder="mm/dd/yyyy" required>
                    @if($errors->has('birthdate'))
                    <p style="color:red">{{$errors->first('birthdate')}}</p>
                    @endif
                </div>
                <div class="form-group">
                    <label>Status</label>
                    <select name="status" wire:model="status" class="form-control">
                        <option value=''>Choose A status</option>
                        @foreach($statuses as $stats)
                            <option value="{{$stats->id}}">{{$stats->name}}</option>
                        @endforeach
                    </select>
                    @if($errors->has('status'))
                    <p style="color:red">{{$errors->first('status')}}</p>
                    @endif
                </div>
                <div class="form-group">
                    <label>User</label>
                    <select name="user" wire:model="user" class="form-control">
                        <option value=''>Choose A user</option>
                        @foreach($users as $user)
                            <option value="{{$user->id}}">{{$user->name}},</option>
                        @endforeach
                    </select>
                    @if($errors->has('user'))
                    <p style="color:red">{{$errors->first('user')}}</p>
                    @endif
                </div>

            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
            <div class="form-group pb-xl-5 pull-right">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
            </div>
        </form>
    </div>
</div>
