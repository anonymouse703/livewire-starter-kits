<script>

    document.addEventListener('DOMContentLoaded', function () {
        // let table = new DataTable('#userTable');
        $('#userTable').DataTable();
    });

    document.addEventListener("DOMContentLoaded", () => {

        Livewire.hook('element.updated', (el, component) => {
            $("#userTable").DataTable().destroy();
            $('#userTable').DataTable({
                responsive: true,
                paging : true,
                destroy : true, 
                scrollCollapse: true,
                scrollY:'50vh',
            });
        });

        Livewire.hook('message.processed', (component) => {
            setTimeout(function() {
                $('#alert').fadeOut('fast');
            }, 5000);
        });
    });


    window.livewire.on('closeModal', () => {
        $('#userModal').modal('hide');
        $('#userTable').DataTable();
    });

    window.livewire.on('openUserModal', () => {
        $('#userModal').modal('show');
    });

    window.livewire.on('openEditUserModal', () => {
        document.getElementById('password').value = '';
        document.getElementById('confirm_password').value = '';
        $('#userModal').modal('show');
    });

    window.livewire.on('closeReferralModal', () => {
        $('#referralModal').modal('hide');
    });
   

    //delete contact
    window.addEventListener('swal:confirmUserDelete', event => {
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
            window.livewire.emit('deleteUser',event.detail.id)
            swal.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
            )
        }
        });
    });

    // window.livewire.on('openReferralModal', () => {
    //     $('#referralModal').modal('show');
    // });

     //password confirm

     var password = document.getElementById("password")
        , confirm_password = document.getElementById("confirm_password");

        $('#submit').on('click',function(){
            
            if(password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;
        })

</script>