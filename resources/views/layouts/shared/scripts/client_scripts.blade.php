<script>

//Contacts

$(document).ready(function() {
    $('#clientTable').DataTable({
        "pagingType": "full_numbers",
        stateSave: true
    });
} );

document.addEventListener("DOMContentLoaded", () => {

    Livewire.hook('element.updated', (el, component) => {
        $("#clientTable").DataTable().destroy();
        $('#clientTable').DataTable({
            responsive: true,
            paging : true,
            destroy : true, 
            scrollY: 300,
        });
    })
});

window.livewire.on('closeClientModal', () => {
    $('#clientModal').modal('hide');
});

window.livewire.on('openClientModal', () => {
    $('#clientModal').modal('show');
});

//delete contact
window.addEventListener('swal:confirmClientDelete', event => {
    swal.fire({
        title: event.detail.title,
        text: event.detail.text,
        icon: event.detail.icon,
        showCancelButton: event.detail.showCancelButton,
        confirmButtonColor: event.detail.confirmButtonColor,
        cancelButtonColor: event.detail.cancelButtonColor,
        confirmButtonText: event.detail.confirmButtonText,
    }).then((result) => {
    if (result.isConfirmed) {
        window.livewire.emit('deleteClient',event.detail.id)
        swal.fire(
        'Deleted!',
        'Your file has been deleted.',
        'success'
        )
    }
    });
});

//

</script>