PGDMP     %    !        
    
    z         
   mydbuddydb    14.5    15.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24607 
   mydbuddydb    DATABASE     �   CREATE DATABASE mydbuddydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE mydbuddydb;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    24658    dlsl_info_faq    TABLE     #  CREATE TABLE public.dlsl_info_faq (
    "ID" text,
    "General Choice" text,
    "Choice Gen Info/Issue" text,
    "Feature Choice" text,
    "MyDCampus/DLSL Option " text,
    "Category" text,
    "Question / Inquiry / Solution / Information Description" text,
    "Link/Response" text
);
 !   DROP TABLE public.dlsl_info_faq;
       public         heap    postgres    false    4            �            1259    24652    mydcampus_info_faq    TABLE     *  CREATE TABLE public.mydcampus_info_faq (
    "ID" text,
    "General Choice" text,
    "Choice Gen Info/Issue" text,
    "Feature Choice" text,
    "MyDCampus/DLSL Option " text,
    "Category" text,
    "Question / Inquiry / Solution / Information Description" text,
    "Link / Response" text
);
 &   DROP TABLE public.mydcampus_info_faq;
       public         heap    postgres    false    4            �            1259    24646    mydcampus_issues_faq    TABLE     ,  CREATE TABLE public.mydcampus_issues_faq (
    "ID" text,
    "General Choice" text,
    "Choice Gen Info/Issue" text,
    "Feature Choice" text,
    "MyDCampus/DLSL Option " text,
    "Category" text,
    "Question / Inquiry / Solution / Information Description" text,
    "Link / Response" text
);
 (   DROP TABLE public.mydcampus_issues_faq;
       public         heap    postgres    false    4            �          0    24658    dlsl_info_faq 
   TABLE DATA           �   COPY public.dlsl_info_faq ("ID", "General Choice", "Choice Gen Info/Issue", "Feature Choice", "MyDCampus/DLSL Option ", "Category", "Question / Inquiry / Solution / Information Description", "Link/Response") FROM stdin;
    public          postgres    false    211          �          0    24652    mydcampus_info_faq 
   TABLE DATA           �   COPY public.mydcampus_info_faq ("ID", "General Choice", "Choice Gen Info/Issue", "Feature Choice", "MyDCampus/DLSL Option ", "Category", "Question / Inquiry / Solution / Information Description", "Link / Response") FROM stdin;
    public          postgres    false    210   �       �          0    24646    mydcampus_issues_faq 
   TABLE DATA           �   COPY public.mydcampus_issues_faq ("ID", "General Choice", "Choice Gen Info/Issue", "Feature Choice", "MyDCampus/DLSL Option ", "Category", "Question / Inquiry / Solution / Information Description", "Link / Response") FROM stdin;
    public          postgres    false    209   �&       �   �  x��Z�r�]�_�Mj���������NI�lʙ�*U��nPD�� ݢ��b�!���|I�ţE�q��&�}q��z|��Q(ax�Fs-S��w�X��`lm%z/+#⢋�و����'��Ӣ�Z�ވ��F�U�s%��5���*iV�6�yUߜiSpwu&lj���;��v�E؅VV�����xx��ݫu��znK���`�NuU2����,�)+%K)l�g=e�f3a,�ʯ�UW,�eҦ�o��1B���趀�+�FW7s|J�r(����ra���2�r�'"���|���;r�9��5G����v.�cH.�Q��W˹����No4�6�y��R�+7�z�'	���T�'iKʅ��@i#x��y�]Ɛߤlx����3��R�H�
K/�^S�6�e�:�ic�ܼ0ZA�N���[-�-��E������]HkQ[��J�������[s�d��+m��.�>�Xu#�OX����Ɣ�g�r�W�G�9R{�/X���Qs����,EƦ+�λ:�f6���E�2^�����n�b��1sA� ����[�²,��"� ���K�m��\�"��k�����'�Eκ8YɛJf�l��YC�t�!~R�� y��2z?�N���6!_c�h^+�������K����6Yd���p�xd��u΍��E�"t��f;q���{*�%' �艈��*yZ�N��i�����%�����s]���܍}�h���;a�Vj��]^��2���F�[�p������? ��k���wn�Nn�A�ጯ���W�������8f{'�����2a��!gyH���|	=�傳�Z���;��nm/Q��	�Pr��~�K�1�^x�)�x7&�\�L�ۿ���B�4ɠ�b�Z~{���S��T�R�-{�������;�������*6)�{�w�v������G��x�����g�_�qr~�5r�����>�;:������������;	Ϗ�w�?���'�)[�n�Z��R��g��7��߂	��������� M·�[Um-�u�Al7���I=��+�L��"L��4�V�zjiD�Mf�i)n:�zBV���?�[ ���݄2�÷L�Ra���E���%�z��I�Md�v���#�1�:7A��]7r`�]�-���$Z�_���%�@~a�nS����핏�nQ`�6�j;`��mʾ����E���������&���ʥ�Z��-
L2)�k�m��F��۲kP�o�;���k�.5�թ���7��
�`���m�W�~\�(�t}�Z}੘j�6���]�f1 ���#�r���ku��q�����6��A�kU�j*��W��[�ιR"|������Uv�7;�_�{'��L��Z	�H��+I��^O8[��=)��)�"n0,nz��mo��poZ:zYb�]�]֡�kDV����͂��Vg��(�Kd�Fʛ�4Sb0����˧�hv�����O��SyZ��Aۥ���+h���Uٕ��"al<sBP�y�B�E�Z@"���L�$N������F��dZ�U����
BB��bJ��}UT>��x^�S������v���v�����N�h����.�,i!���K+�����ւM��U����Dh�α)����l�"t��xo��LN�ެJ7M�u�ࡾq�Cr�k9�h�N��<�����Mbsy�����~1��b']'�RF!��	.h7���Zd�c�v,�g�h�h�ѝN��W���5k�f��z���BSB�a�ʌ7�Y�6�'�S
eYI'�ʐ�՜ߑ�p&�Z��b�Fu���F�H���(���Bg�*�7��^�wؗ��h�]~<�W=fQ�O���a��T��\�9 s�g�S�wـGa����47h�#��g��O<q���k�m%�\�!`^���؁UQs�ԏ���V��w4�"Wr���n�r&� U��K�	�����>�ke3�զle�k���܆�۠\�2^nRі�bDV钎FHC��otr���$ӊ�(�ܔ2Yd`��V�Pa[�w�����yW9xhS4?��#+7�K*F�����0��?Æ�J��]jf��uCs'�7Am<��������5B����_�Q��d��ߚ=�;x�'����9p����pP�<,���Dӕe��x`2����ƞڐ]x?����{���FmMW��4-*���3Dt��5y�c�hv�s�岜W��<N]+���l�̔���
��U�):x����J����@���[�I	r��j+t -@_`��V�"����!� l}?:<��d�6+�#���ڹ��C@ G����7P�.�z0��a�x����dRi&�O��w���^g��A��u~�������'���3�6C�f��s߸@�4�5�C�-l������#r�*��Z�Ґ6Yˇ�o�A���I��1M5}��K���/߿�^��
 �d��P��+ �T
|;��z`���_�>�]��Ñ��z�ltRPk*�A=/P?��Q�j�/�F^H.޹s�n�thJ����Ź�@�1}f9�?��Ҩ�'V���U^��"��dE8M�}��텸z�-����a��˃|XQ�~(I5���Y�����2��4����H[߉�	��?�W�~�U��wj��GZ�t�ӻ��L�t��<@t�,�X�2��L�sͳ�.��Nۚgcsn&��R/��y�u�n��u�Bx���,ſ���VV�]d�@V9A �u;v��,��?	Sb�<�7
�*�&y�^��Z%�������0u�v����]A������[�e�uJ���4��GL����)=O�V�~Ĵ��R�rV6��V)չ%]��J�=LUQ���H�ܠu&#�
;���v�Ij��M*�y
5w��[�y��U^�zL�w9��\����0)�,BdiB7���]�ug�~� ����_m�K�����ݡK�Y�ZM��<�":�.r���Y����u��ŋ6��_      �   �  x��\�o�8���<�i�8�k�C�N���qڻX�m��D/)%���o��p=b�_�H$�3�G��ǣ������9���f�5Z}�S)r�hI�Z=����N�O�[��p4I�|bʑ|r����!ኤ�>�!p��;6}?����cT<��t�|�D�T�|a�tE�94.Qa�B'EČ|N�$�:S�ِ!"�x��#"���%o΍��"zhN���1���9[kh�W4�'7�W!��( �$����鼇������p��ǡ7��h�*!2�X�Ќ]���t�^�4t�"�/t�p*�P����_	Y��R��n��Q�s!��u��VKɨ����������ֹ��9����������������r��j3���s��G�����ށ���Si�SA���i���f��{����G'��_�+����jx�b���%??Mu��9=�;>89<���6��"?E���u������4��j��U< �Nt�NF��r3g�<�Κ:�a�bb�HJ�D^�'�`���OWj��H��B8+��(�-����ި����0h;�C&�#{h�'`����H�$�h[�IJ��Ŗ
!.�/�����+��z�u=�킆w���/���)#��;k;SF��e�Ξ��O����ɰ�W?�'am�X��^5@�ȗ�)�)��%��* �p�a{jf�=~��Zj���<��-��G�'��v�̶��NY���,{wN��e��1���FN��6r� ˁ�ѧ���I_8\T6�D�`E)4�ӿ�����a:�?���N�W1�D�ʆ���:e��A�0�*.�r[(�����V�W�j�3�5d�F�{!�j��"����cu�ψY��5s���|��U9�G/�Z�d!�u�(�t�b����T�b�6�Mrx�N�׾��(�f�@*����0���,YTrlbQ���(O[��t裠(%��H�����jEuaE^�}�rj�?�"Ϯ����'�{c%��zϦԼ��b�g��z���W��J5[@0��a}i�z�C�^�_�p4V��/j�,q�(�4)[�X4Vx������/���=����.��G�r��v�j1�E�u+4
�����y�6R~��YV�k�8�(~[�T�!�:Q���u�4
�D�j�$�\Ξ ���N�0�cX.���J�%�z�d�U[�\��z~�S�f����X!!�X:S�B``��c�. 6׃�2Ⱦ���M��-s�R�O�YYVi4	�e����͢f�5��&z����a��T4���cNā�=�՗F-e���5V�h;`��8x�d_z���5Vi�����`��W��K���X��J(a�������2�/���W�
s���
'�C�ܓ�
T_p��4V4� 5
��@�PKR���kI�������|>���ܛ�>-����	}��_��eq�Xͤi7����/�_�_u���<�>�!���f���L�+,o�B�0��쓋�w��.�pX�]EOVF�d#�>o��a������p����ɐޡ���ֿ�I8!(�sI}T�N�-�r��'U���zvГ�����Y�5V��������C��v�2�l"��|`Y���*�+[U H�᬴oz0+�V�o����e�P��#�-��z���y���Q��$Q��'�M��ᖐ��9)|��ٌIf+F%��-�ԮUA�����?^��؜���6����n=s��<ٴ�iS|�o�M�Xf"
��Rt$̈́�w��R�݋ύ�;{'�V�;݋�5H�\
�s�h�_(*O�[�b�I#�t�q������9 �ˣ̴9󿙶)Df�c��i��Sc����w��7��L��}V����s�
`[ڱ *c���J��	xrح�W�
8�J��R��k�M������9�rv����(��-vkl%R��3X�98:,�7�m>��48l���&)m �$7�/�pҭ�e�Z�5b*,&���X��e+�T�5�Qd��ݑBސk�C[����ߗ�����V�FV�&G�B�p.�*5�{#r�e
��r��T�1ۈAG�.��kȡ�ºڶ�c����pp��]1���� ��O������74[W�(��}A!uZ�����$7�_�[3:�X��ע)�LX)�+� řW��
.�����������f�a�?�C)[��1_� 1����;�R�E
�kfԁ(�W���0�U����S Y�e�e}��wdqυ�T�
��&����hZ(���k��e�Cu�����7n̕JI5P��r4����/�Tv��6,�=4��4
�qH������yM�K�4�ܝӮ9?�܎Y����Zt�
X�<�A� ����iu��8����A�O�	A��U���hg<��s���^o˹u.�e����A&�7&�sEK�h�@6�����b~&�7�d��J�/W%3|��z�e�+p?B�AX�q'���[v%2�lX�m�w�$�G��ʽ=���f�V��ݚ���߃C3�?���q��|�.�x
D8'S��F���U:�WR뉿�1��1��$_��~�ɫ,�o��w�Td�4�\F`��,(,K�]c]_�8]e,F�=��"��ہ&�,���U	���{�ٻ���e�.�1�R.t0A�ƶf�{x�/1�$R�M%��D�I�Ђ[ ����ufIW�$����#"
a���ʍ�fmJ=
ؤq���RY?kf5Ɋ�l$oapbO����l6��l�|?i\ee�,R�>A�C��s�%-����}\�~�!&��PQ��S��Mcd�U�-� ��Ϥk%�t�eA����uav�0Z�cF��2N3}s+t����F>�K��T��ӕ%,P��i�>z�C����H�;�M�:���Y���p,Y�n�%A��:�7�JE-��;*�3X�)׏G������%dX��~�-���!����/��O_1������qi������7��}����^?�I      �   g  x��\[o۸~Nߺ�ı�\��Hs����sriQ� -�6OdQG��_fx�d�%;,��5q>�������j|c!�i@���2/��Wte	�'Iƒ�K��lƽ�+�iBwO�c��0M��
2PE� ���(a��d�)��|�B~��x�8�!<��գ�i,�ɔ,E��NFKx{�' �@C�ƙ�r&D��\"��럄L�4J�<:J�(qz�Ip���0����h�r/`G'��)�:��zH.���$8ѻ%��Xp�\�9�X%Ph\Y�j��
_�xo�:�nC�.�_>I���̗h��_i�=�0
X2"�	~˸�J���9�d$�+�&vPb!�#F��$a���tʓ�(��
'�C}��O�����Ec�Q\?�l��������,R��ƨu�PP���A��_4��/�r��/D{ ���㠀B̨_��S�J�|	%ZV����Y$N��B0�ᄑ�X�y ��^��h���x�SR��H�F����M��Hqn�8�/`�Kb����8����t�f��I�f�14��g+g��1�� "j t$�ԸJ��b؅����pĎ��i�"8	'�������,�����Jo��8��[��Km�ds������[ ���F��G�\�������G���JEKJ�������c>ضB�&4�M@{sl����<J�,@��p�6����:n��S
� VN�NDO���H"�٣@��<Z8�{:X������w�'�E7夕 �NO��&��Sr͓(�˄�R���!f�;J��<d�|�e�{U+)q����7I�Am�N�F6��ecm�cS�Z�#�p��wh0�&��ў��@�8MƲ��]s�;���u�p���3yR�R��W��a�x�~�AFX���0�[y��V~Z}{U\��P��C^�Џ���1�]B-3˭��R�'亴����D�d�C��� 8�t�5�Q���[|�C
d|񀧜%�O��D���9*Q�z�V�EBr�4P�^"�Q�'&��b&�@�����#��< uH䣔zi��|��w �(��Hb߹jC�ѥ��G����t۝V�݆�ه��U{�@���4Ć	ߨ�ҋ�1�zH���S>W�X�i���`��Y�gh��b��qJ����#Y�J���V�|U�Ĩ�B�U�b%�A�OyB���k�3��߀��f���Q� 1�u�ÊT&-��cq����X]���a������i@�	1����χY���J���~~+mi��'g6|���ۍ���(D��Z	(���2V͟�av���˱��c�1@��o��\��7�����6�]�v����Sm~�)�n��̆"�3����1&+T�� b-��$���X�5�](N�L��T����a�{@��2�E��|k��%�W��£&�w���p<2]�+��M����{1�`����,���y��1�)�.���T��f.��w4�@��z���\����3]�zt�e<L�"�sf>�MꑌZ*!�*��2Q�ݐ��qF_�\\-o�ʺZ2fKw�4��a�UC0e�7��9` �"��7U1sG�"JJ3a��/�~ۢ�ۏ,�.{f����igQI%N��(]�@�ef���͖�90�=��]�l�3RK%�Ic$f�i6j�K:��=�t��G�����?�̍ۥ�M�k]B�K '�?��oE<;0��s����S'�R]�Bn��C��C�U���H�1~{'Fx_ ��#%AZHu�R%eի"5�N��mQ���/��S�h��z[hQK��%'�E��j-�@e,�����0PY��N����uL'"D��vi��R}�#H� f����G�JjE�Tw+�ګ���۳���z���pUŽnT��˻IB���P�3�	|lj����+�}Y"��g�;b1g�����KU+
���^Qҭ�ߴNж:D����C�q ��^�X�-�xҲ<��o@S �����3��Cѩ)6}4�j�+�W,ַ�r+=�	�TT��j����pQ�e`;^�ʆU��+��~�d�Nkʉ�p��^�r���Tm<{mժ2t:6�hOG�oZw���s	��hS��١x��V��(�K����x���n�@LT8��A�2��;v�`n4+��5O���(��Vo:�l��`�.�=2�a*Q�i�=��'���Ur��f��+���H�:g�v���f��(/�IԿ�L�|p˞������<цs?*������j���f�^m��߳>���9��nͧ%�(��V^�ĩ¡H� �f����p�����á|_��͂�-�X먓W>Q�`�斾m�\��Lk�C=�Mhp��<NC|��V��660*�Y�![�)۹Վq���z�Cվ>�pQU�Z���-k�SkhM�$c��w�CӜ.m6���]�Ɓ+��a�%/o�a�ð��h'>~f��K�M-T
�)���0#G0h4�̽W��Tǳ�<ʛ6��H��65�^5�6-nj�)�#�R�y�#ːj�&7P�8aL.�^��qW����v�.ѱ&`C?�)�Nkh���,��i�f ��j����8��Z�ƥ��DDd �5(����ҥ�gug�;�֣��=^�I�!{.M=�"�����<��2d�,�ҹ�*��AJ���i�d�.6�5#�q��6#��My �C��"���bߵm]��hݦ1�_�j�Y�؍׌o�#y~[)V��4����[A��mphƁ����^�2L
�8��v��I�涍WbMS�^���ߌ5׵_�I�M�-v�+��5���1F7����c��yqo��Ϥ�|�灖U����o��b;
�+�PZgZ���R��\U}(��O��q!�ű+�t�|�;��	�.].�1�\���;mΘ��R�V�vd�Зe��7Йa./M�ٚ;ia���0Hc��q�Α�F�����U���R�0J��_L"2n�I�߯m`y�:f�>�f���������\^]_���B\VS�AR�R��?���$�;t�!-�����6K����t��ڗ��9,ە�ͲP_�\��/�TL�V���k�7s��i�g�[�}��m)}39%v1,?i�G�����z[�¢m��^� By����]kq3檬����\=����7>�,H��>o"n�%Y��oq�������&�U�%N���ol��
M�$皦�Xd�T;͘ꚽ���Ȕ�Hl�hak$ti�	 @��� 4�(
Oq�ڷ�K�Q�Zͣ�ϸ̂w��5 ��f`�*���ꝥY�*�+���֪k�D�uC��[_�W���6c�n��Q���ű{��\Ht��G7�@B 	9n7ƠZ�^�0�ی��C�lg$�����9������>     