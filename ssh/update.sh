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
BZh91AY&SYS��Y t߹A0�����������  � ��� `Yϙw5��47w��$��L�ez��hɠbh��b2  ��ѣ@�h����� 4�  `�S�$�'��&���@ �4  �"��O# S'��hH  4���F���1��� i�  � � ��i3$�����DS��7�i#Oʀ�4z��Q�1AOh�S/&�Uȱ"��p?�q�S��L������(C���J�d]
���TQI��Is tfdK���N$���ۘ�9Q�Jp��n�1��p:�t�_B��F9]�co�мL)0�t;tm�
���t�4�;����}�q4s�C5��^~Z]�R���NLgB���Bj�=� pLq�@w�Ӑ���� ��Z?�'$_��?H/��,�ږ��UtB���5��`�·"�]�Y�E��ӆ�Y�F��XPU�l�kWdd( #l�hϼ~׋�O�	��8}`�Ĭ�>�$EbQ� ���#�A0�c2\JPJ�`��_� �f���QF�5ea����]��|�Zh�%{���l���I?Ci����@nAfm'9��K��q[�$����~`�;�y������JJ�f��!)O5��?��.c���]�\*m����E# c�p�8Wi�؝˾D�2z�"�:5��-�m�^�;A�T�	-���hs���0X�����/�!�^�������e1ݍ�-� ��z<�?Z���
Xr;�m�:�n�5s��` %i����Dv��\v�Ŋ2�l�fW�D� !�:��#I�[�Σr�ߌc�eH�9�%j�$7K����ܐ���? {@��i%F�q[��,�k�Cy���M^�S5Qб�Q�,*_&���)�ͧ�D�TS�Dv{qM[��Ř2I1{��Hϗ�@�;n��3cx��,��BqP�G+�Jd}�&G�$�(G�:�9���]�O�P"��`$[�x{����yܱDʰ�A`ف���?�SN�{<�^� �Y�r�eP���Pk��.�!-r3ܷ�X���n��P�J��Y�r|��R�%X`�i�t�S2��1���1��8*�L��!�b��D�E�q�;�@� u���%�����zc9Gv U���N^���`�D>�����Gʑ�tʖ,����ݛ�U�e��o�DKxP ��f��Ց��ʶ'��l�������]'�L��.;����&��4J���Bs�w�{x�s6��ȋF�q<@��ʁj��FW'w��9��V3&EH�Ç�.t���¤�j;��P���`�M�(T�G}7��rT��8�J`�۷���\���+{F�J�Dm1��i-{�*ZW�!�mk��c�����_�)u�[������U��{�HD��<�hXu�nlM�a5�,�3ނ����3�F6|i�j�9���ES����@�N�1�XSa��_.F�u����8O%��� ��$�X՜�B~I`���{��7����B�#��H� �����L�X�L�
�Z�r��\�M��KRr�RmI�a*LNK�A��b\Oyۃ5I'�H��L��69�E8W/�A��eYBs���%M���u s�x�>�C���.�q-ӑ2�ѝI&:ټ�/��}C!�+�DȢ�6H(j���\�DD��}5�e"nJǝ�)?]��Eȣ��i8�1�:����(�H7'B����/!�^��@�'ﷃR�f`]K�'O��WCFp�#�̵�k�sT�+�ueb	�Ad��O=���5jK^�`�i�-i�+kэ�5Ę�N���V)��F�dSE���0�"�.��0t�CQ���P��,7 G'���͠�*1�&j`�Y�p��1��b
�)l<��W)4Ltۺ��Te/E��M�9u�X��5��@K �0a+�s�]��BAO��d