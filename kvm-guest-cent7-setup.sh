# download centos7 install ISO image
# curl -LO http://ftp.riken.jp/Linux/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso

# create kvm image
qemu-img create -f raw $1.img $2

# create VM & Install
virt-install \
--name $1 \
--hvm \
--accelerate \
--virt-type kvm \
--arch x86_64 \
--vcpus 1 \
--ram 256 \
--disk $1.img \
--os-type linux \
--boot hd \
--serial pty \
--console pty \
--graphics none \
--location CentOS-7-x86_64-Minimal-1611.iso \
--initrd-inject centos7.ks.cfg \
--extra-args 'console=tty0 console=ttyS0,115200n8'
