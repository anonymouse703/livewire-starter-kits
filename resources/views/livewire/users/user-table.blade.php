<div>
   <!-- page content -->
   <div class="row">
        
        <div class="col-md-12 col-sm-12 ">
            <livewire:flash-message.flash-message />
            <div class="dashboard_graph">
                <div class="row x_title">
                    <div class="col-md-6">
                        <h3>User Information</h3>
                    </div>
                </div>
                <div class="row">

                    <!-- Button trigger modal -->
                    <button type="button"  wire:click="createUserProfile" class="btn btn-primary ml-3" data-keyboard="false">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Add User
                    </button>

                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">                                
                                            <div id="branch_table" class="display">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table id="userTable" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
                                                            <thead class="text-center align-middle">
                                                                <tr role="row">
                                                                    <th>Name</th>
                                                                    <th>Email</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                @foreach ($users as $data)
                                                                    <tr>
                                                                        <td>{{$data->name}}</td>
                                                                        <td>{{$data->email}}</td>
                                                                        <td class="text-center align-middle">
                                                                            <div class="btn-group">

                                                                                <button wire:click="editUserProfile({{ $data->id }})" class="btn btn-info delete-header m-1 btn-sm"  title="Edit"><i class="glyphicon glyphicon-pencil" small></i></button>
                                                            
                                                                                <button wire:click="deleteConfirmUserProfile({{ $data->id }})" class="btn btn-danger delete-header m-1 btn-sm"  title="Delete"><i class="glyphicon glyphicon-trash" small></i></button>

                                                                            </div>                
                                                                        </td>
                                                                    </tr>                               
                                                            
                                                                @endforeach  
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--end sa table row--->

                </div>         
            </div>
        </div>

    </div>
    <!-- /page content -->

    <!-- The Modal -->
    <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModal" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <livewire:users.user-form />
        </div>
    </div>
</div>
@section('custom_script')
    @include('layouts.shared.scripts.user_scripts'); 
@endsection