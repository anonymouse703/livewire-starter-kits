<div>
   <!-- page content -->
   <div class="row">
        <div class="col-md-12 col-sm-12 ">
            <div class="dashboard_graph">
                <div class="row x_title">
                    <div class="col-md-6">
                        <h3>Room Category Information</h3>
                    </div>
                </div>
                <div class="row">

                    <!-- Button trigger modal -->
                    <button type="button"  wire:click="createRoomCategory" class="btn btn-primary ml-3" data-keyboard="false">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Add Room Category Information
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
                                                        <table id="roomCategoryTable" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
                                                            <thead class="text-center align-middle">
                                                                <tr role="row">
                                                                    <th>Room Image</th>
                                                                    <th>Room Name</th>
                                                                    <th>Price</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                @forelse ($rooms as $room)
                                                                    <tr>
                                                                        <td>
                                                                            @forelse($room->images as $img)
                                                                                <img style="width:180px; height:200px" src="{{url('storage/images/'.$img->image_name)}}">
                                                                                @empty
                                                                                No Room Category Image Available
                                                                            @endforelse
                                                                        </td>
                                                                        <td>{{$room->name}}</td>
                                                                        <td>{{$room->base_price}}</td>
                                                                        <td class="text-center align-middle">
                                                                            <div class="btn-group">

                                                                                <button wire:click="editRoomCategory({{ $room->id }})" class="btn btn-info delete-header m-1 btn-sm"  title="Edit"><i class="glyphicon glyphicon-pencil" small></i></button>
                                                        
                                                                                <button wire:click="deleteConfirmRoomCategory({{ $room->id }})" class="btn btn-danger delete-header m-1 btn-sm"  title="Delete"><i class="glyphicon glyphicon-trash" small></i></button>

                                                                                <button wire:click="addRoomCategoryImage({{ $room->id }})" class="btn btn-info delete-header m-1 btn-sm"  title="Add Image"><i class="glyphicon glyphicon-picture" small></i></button>

                                                                            </div>                
                                                                        </td>
                                                                    </tr>
                                                                    @empty
                                                                    <tr>
                                                                        <td colspan="4">No Record Found</td>
                                                                    </tr>
                                                                @endforelse  
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
    <div class="modal fade" id="roomCategoryModal" tabindex="-1" role="dialog" aria-labelledby="roomCategoryModal" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <livewire:room-category-form />
        </div>
    </div>

    <!-- The Room Category Image Modal -->
    <div class="modal fade" id="roomCategoryImageModal" tabindex="-1" role="dialog" aria-labelledby="roomCategoryImageModal" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <livewire:room-category-image-form />
        </div>
    </div>
</div>
@section('custom_script')
    @include('layouts.shared.scripts.room_category_scripts'); 
@endsection