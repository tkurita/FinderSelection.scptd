FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Copyright (C) 1999-2020 Tetsuro KURITA

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Foobar is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar.  If not, see <http://www.gnu.org/licenses/>      � 	 	   C o p y r i g h t   ( C )   1 9 9 9 - 2 0 2 0   T e t s u r o   K U R I T A  
 
 T h i s   p r o g r a m   i s   f r e e   s o f t w a r e :   y o u   c a n   r e d i s t r i b u t e   i t   a n d / o r   m o d i f y 
 i t   u n d e r   t h e   t e r m s   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   a s   p u b l i s h e d   b y 
 t h e   F r e e   S o f t w a r e   F o u n d a t i o n ,   e i t h e r   v e r s i o n   3   o f   t h e   L i c e n s e ,   o r 
 ( a t   y o u r   o p t i o n )   a n y   l a t e r   v e r s i o n . 
 
 F o o b a r   i s   d i s t r i b u t e d   i n   t h e   h o p e   t h a t   i t   w i l l   b e   u s e f u l , 
 b u t   W I T H O U T   A N Y   W A R R A N T Y ;   w i t h o u t   e v e n   t h e   i m p l i e d   w a r r a n t y   o f 
 M E R C H A N T A B I L I T Y   o r   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E .     S e e   t h e 
 G N U   G e n e r a l   P u b l i c   L i c e n s e   f o r   m o r e   d e t a i l s . 
 
 Y o u   s h o u l d   h a v e   r e c e i v e d   a   c o p y   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e 
 a l o n g   w i t h   F o o b a r .     I f   n o t ,   s e e   < h t t p : / / w w w . g n u . o r g / l i c e n s e s / >     
  
 l     ��������  ��  ��        j     �� 
�� 
pnam  m        �    F i n d e r S e l e c t i o n      l     ��������  ��  ��        l      ��  ��   4.!@references
XList || help:openbook='XList Help'
Home page || http://www.script-factory.net/XModules/FiderSelection/index.html
ChangeLog || http://www.script-factory.net/XModules/FinderSelection/changelog.html
Repository || https://github.com/tkurita/FinderSelection.scptd
Constructor || #Constructors
     �  \ ! @ r e f e r e n c e s 
 X L i s t   | |   h e l p : o p e n b o o k = ' X L i s t   H e l p ' 
 H o m e   p a g e   | |   h t t p : / / w w w . s c r i p t - f a c t o r y . n e t / X M o d u l e s / F i d e r S e l e c t i o n / i n d e x . h t m l 
 C h a n g e L o g   | |   h t t p : / / w w w . s c r i p t - f a c t o r y . n e t / X M o d u l e s / F i n d e r S e l e c t i o n / c h a n g e l o g . h t m l 
 R e p o s i t o r y   | |   h t t p s : / / g i t h u b . c o m / t k u r i t a / F i n d e r S e l e c t i o n . s c p t d 
 C o n s t r u c t o r   | |   # C o n s t r u c t o r s 
      l     ��������  ��  ��        l      ��  ��   ��!@title FinderSelection Reference
* Version : 2.1.1
* Author : Tetsuro KURITA ((<scriptfactory@mac.com>))
* Requirements : OS X 10.9 or later
* ((<Home page>)) || ((<ChangeLog>)) || ((<Repository>)) 

FinderSelection is an AppleScriptLibrary to obtain items meeting specified conditions from selected items in Finder.
By using FinderSelection, following complex sequence can be easily performed with several lines.

(1) Obtain Finder's selection filterd with conditions of specified kind, file type or path extension.(2) If items matched with the conditions did not exist, a panel to select files will be opened.(3) In the case of you script is an applet or a droplet and the application is launched with double clicking in Finder, a panel to select files will be opened.(4)If alias files are included in selected items, the originals are checked with the conditions.  * The behaivior can be changed to prevent following originals at setting.

Actual sequence of code is as follows.

(1) Generate an instance of FinderSelection by ((<Constructor>)) methods. Choose ((<Constructor>)) depending on kind of files and folders you want.(2) Set a message displayed in the open panel by ((<set_prompt_message>)).
  * The open panel will apear when thre are not items matched with the conditions.(3) URI, file tyepe and path extension can be included in the conditions by ((<set_types>)), ((<set_extensions>)).  * When both of ((<set_types>)) and ((<set_extensions>)) are set, target items will match with either file type or path extension.(4) By ((<get_selection>)), you can take a list of items matched with the conditions 

The following script is a sample to obtain text files and PDF files from Finder's selection.
     �  x ! @ t i t l e   F i n d e r S e l e c t i o n   R e f e r e n c e 
 *   V e r s i o n   :   2 . 1 . 1 
 *   A u t h o r   :   T e t s u r o   K U R I T A   ( ( < s c r i p t f a c t o r y @ m a c . c o m > ) ) 
 *   R e q u i r e m e n t s   :   O S   X   1 0 . 9   o r   l a t e r 
 *   ( ( < H o m e   p a g e > ) )   | |   ( ( < C h a n g e L o g > ) )   | |   ( ( < R e p o s i t o r y > ) )   
 
  F i n d e r S e l e c t i o n   i s   a n   A p p l e S c r i p t L i b r a r y   t o   o b t a i n   i t e m s   m e e t i n g   s p e c i f i e d   c o n d i t i o n s   f r o m   s e l e c t e d   i t e m s   i n   F i n d e r . 
  B y   u s i n g   F i n d e r S e l e c t i o n ,   f o l l o w i n g   c o m p l e x   s e q u e n c e   c a n   b e   e a s i l y   p e r f o r m e d   w i t h   s e v e r a l   l i n e s .  
 
 ( 1 )   O b t a i n   F i n d e r ' s   s e l e c t i o n   f i l t e r d   w i t h   c o n d i t i o n s   o f   s p e c i f i e d   k i n d ,   f i l e   t y p e   o r   p a t h   e x t e n s i o n .  ( 2 )   I f   i t e m s   m a t c h e d   w i t h   t h e   c o n d i t i o n s   d i d   n o t   e x i s t ,   a   p a n e l   t o   s e l e c t   f i l e s   w i l l   b e   o p e n e d .  ( 3 )   I n   t h e   c a s e   o f   y o u   s c r i p t   i s   a n   a p p l e t   o r   a   d r o p l e t   a n d   t h e   a p p l i c a t i o n   i s   l a u n c h e d   w i t h   d o u b l e   c l i c k i n g   i n   F i n d e r ,   a   p a n e l   t o   s e l e c t   f i l e s   w i l l   b e   o p e n e d .  ( 4 ) I f   a l i a s   f i l e s   a r e   i n c l u d e d   i n   s e l e c t e d   i t e m s ,   t h e   o r i g i n a l s   a r e   c h e c k e d   w i t h   t h e   c o n d i t i o n s .      *   T h e   b e h a i v i o r   c a n   b e   c h a n g e d   t o   p r e v e n t   f o l l o w i n g   o r i g i n a l s   a t   s e t t i n g . 
 
 A c t u a l   s e q u e n c e   o f   c o d e   i s   a s   f o l l o w s . 
 
 ( 1 )   G e n e r a t e   a n   i n s t a n c e   o f   F i n d e r S e l e c t i o n   b y   ( ( < C o n s t r u c t o r > ) )   m e t h o d s .   C h o o s e   ( ( < C o n s t r u c t o r > ) )   d e p e n d i n g   o n   k i n d   o f   f i l e s   a n d   f o l d e r s   y o u   w a n t .  ( 2 )   S e t   a   m e s s a g e   d i s p l a y e d   i n   t h e   o p e n   p a n e l   b y   ( ( < s e t _ p r o m p t _ m e s s a g e > ) ) . 
     *   T h e   o p e n   p a n e l   w i l l   a p e a r   w h e n   t h r e   a r e   n o t   i t e m s   m a t c h e d   w i t h   t h e   c o n d i t i o n s .  ( 3 )   U R I ,   f i l e   t y e p e   a n d   p a t h   e x t e n s i o n   c a n   b e   i n c l u d e d   i n   t h e   c o n d i t i o n s   b y   ( ( < s e t _ t y p e s > ) ) ,   ( ( < s e t _ e x t e n s i o n s > ) ) .      *   W h e n   b o t h   o f   ( ( < s e t _ t y p e s > ) )   a n d   ( ( < s e t _ e x t e n s i o n s > ) )   a r e   s e t ,   t a r g e t   i t e m s   w i l l   m a t c h   w i t h   e i t h e r   f i l e   t y p e   o r   p a t h   e x t e n s i o n .  ( 4 )   B y   ( ( < g e t _ s e l e c t i o n > ) ) ,   y o u   c a n   t a k e   a   l i s t   o f   i t e m s   m a t c h e d   w i t h   t h e   c o n d i t i o n s   
 
 T h e   f o l l o w i n g   s c r i p t   i s   a   s a m p l e   t o   o b t a i n   t e x t   f i l e s   a n d   P D F   f i l e s   f r o m   F i n d e r ' s   s e l e c t i o n . 
       l      �� ! "��   !
Finder �̑I�����ڂ��擾���� AppleScript ���C�u�����ł��B�ȉ��̂悤�ȏ������ȕւɍs���܂��B

* Finder �̑I�𕨂̒�����K�v�Ȃ��́i��ށA�t�@�C���^�C�v�A�g���q �Ŏw��j������I�яo���܂��B
* �I�𕨂��Ȃ�����������ɊY��������̂��Ȃ�������A�t�@�C���I���_�C�A���O���J���܂��B
* Droplet/Applet �� Finder ����_�u���N���b�N�ɂ���ċN�����ꂽ��A�t�@�C���I���_�C�A���O ���J���܂��B
* �I�𕨒��ɃG�C���A�X�t�@�C�����܂܂�Ă�����A�I���W�i���ւ̎Q�Ƃ��擾���ăI���W�i���������ɊY�����邩���ׂ܂��B
  * �G�C���A�X�t�@�C���̃I���W�i�������߂Ȃ������ݒ肷�鎖���ł��܂��B
�����̗���͎��̂悤�ɂȂ�܂��B
(1) ((<Constructor>)) Method �ɂ���āAan instance of FinderSlection�𐶐�����B�ǂ� ((<Constructor>)) ���g�����ɂ���āA�擾����t�@�C��/�t�H���_�̎�ނ����܂�B(2) ((<set_prompt_message>)) ���g���ăt�@�C��/�t�H���_�I���_�C�A���O�̃��b�Z�[�W��ݒ肷��B  * �t�@�C��/�t�H���_�I���_�C�A���O�͏����ɂ������I�𕨂������ꍇ�ɊJ����܂��B(3) �K�v������΁A((<set_types>)), ((<set_extensions>)) �ɂ���āAURI�A�t�@�C���^�C�v�A�g���q�̏�����ݒ肷��B  * ((<set_types>)), �� ((<set_extensions>)) �𓯎��ɐݒ肵���ꍇ�A�ǂ��炩�̏����Ɉ�v������ړI�̃t�@�C���ƌ��Ȃ��܂��B(4) ((<get_selection>)) �ɂ���āA�����ɂ������AFinder �̑I�𕨂��擾����B

�e�L�X�g�t�@�C���� PDF �t�@�C�����擾�����������܂��B
    " � # #X 
 F i n d e r  0n�xb��v�0�S�_�0Y0�   A p p l e S c r i p t  0�0�0�0�0�0g0Y0N�N0n0�0F0jQ�t0�|!O�0k�L0H0~0Y0 
 
 *   F i n d e r  0n�xb�ri0nN-0K0�_ŉ�0j0�0n�z.�^00�0�0�0�0�0�0�0b�_5[P  0gc[��	0`0Q0��x0sQ�0W0~0Y0 
 *  �xb�ri0L0j0K0c0_0�gaN�0k�r_S0Y0�0�0n0L0j0K0c0_0�00�0�0�0�xb�0�0�0�0�0�0���0M0~0Y0 
 *   D r o p l e t / A p p l e t  0L   F i n d e r  0K0�0�0�0�0�0�0�0�0k0�0c0f�wR�0U0�0_0�00�0�0�0�xb�0�0�0�0�0�  0���0M0~0Y0 
 *  �xb�riN-0k0�0�0�0�0�0�0�0�0�0LT+0~0�0f0D0_0�00�0�0�0�0�0x0nS�qg0�S�_�0W0f0�0�0�0�0�0LgaN�0k�r_S0Y0�0K��0y0~0Y0 
     *  0�0�0�0�0�0�0�0�0�0n0�0�0�0�0�0�lB0�0j0DR�O\0��-[�0Y0�N�0�0g0M0~0Y0 
 Q�t0nmA0�0ok!0n0�0F0k0j0�0~0Y0 
  ( 1 )   ( ( < C o n s t r u c t o r > ) )   M e t h o d  0k0�0c0f0 a n   i n s t a n c e   o f   F i n d e r S l e c t i o n0�ub0Y0�00i0n   ( ( < C o n s t r u c t o r > ) )  0�O0F0K0k0�0c0f0S�_�0Y0�0�0�0�0� /0�0�0�0�0nz.�^0Llz0~0�0  ( 2 )   ( ( < s e t _ p r o m p t _ m e s s a g e > ) )  0�O0c0f0�0�0�0� /0�0�0�0��xb�0�0�0�0�0�0n0�0�0�0�0�0��-[�0Y0�0      *  0�0�0�0� /0�0�0�0��xb�0�0�0�0�0�0ogaN�0k0B0c0_�xb�ri0Lq!0DX4T0k��0K0�0~0Y0  ( 3 )  _ŉ�0L0B0�0p0 ( ( < s e t _ t y p e s > ) ) ,   ( ( < s e t _ e x t e n s i o n s > ) )  0k0�0c0f0 U R I00�0�0�0�0�0�0�0b�_5[P0ngaN�0��-[�0Y0�0      *   ( ( < s e t _ t y p e s > ) ) ,  0h   ( ( < s e t _ e x t e n s i o n s > ) )  0�TfB0k�-[�0W0_X4T00i0a0�0K0ngaN�0kN ��0W0_0�v�v�0n0�0�0�0�0h��0j0W0~0Y0  ( 4 )   ( ( < g e t _ s e l e c t i o n > ) )  0k0�0c0f0gaN�0k0B0c0_0 F i n d e r  0n�xb�ri0�S�_�0Y0�0 
 
0�0�0�0�0�0�0�0�0h   P D F  0�0�0�0�0�S�_�0Y0�O�0�y:0W0~0Y0 
    $ % $ l      �� & '��   &?9!@example
use FinderSelection : script "FinderSelection"set file_picker to FinderSelection's make_for_file()tell file_picker	set_prompt_message("Choose text file or PDF file.")	set_types({"com.apple.traditional-mac-plain-text", "TEXT", "PDF "})	set_extensions({".txt", ".pdf"})	get_selection()end tell
     ' � ( (r ! @ e x a m p l e 
 u s e   F i n d e r S e l e c t i o n   :   s c r i p t   " F i n d e r S e l e c t i o n "   s e t   f i l e _ p i c k e r   t o   F i n d e r S e l e c t i o n ' s   m a k e _ f o r _ f i l e ( )   t e l l   f i l e _ p i c k e r  	 s e t _ p r o m p t _ m e s s a g e ( " C h o o s e   t e x t   f i l e   o r   P D F   f i l e . " )  	 s e t _ t y p e s ( { " c o m . a p p l e . t r a d i t i o n a l - m a c - p l a i n - t e x t " ,   " T E X T " ,   " P D F   " } )  	 s e t _ e x t e n s i o n s ( { " . t x t " ,   " . p d f " } )  	 g e t _ s e l e c t i o n ( )  e n d   t e l l  
   %  ) * ) x    
�� + ,��   + 1      ��
�� 
ascr , �� -��
�� 
minv - m       . . � / /  2 . 3��   *  0 1 0 x   
 �� 2����   2 2   ��
�� 
osax��   1  3 4 3 x    )�� 5���� 0 xlist XList 5 4   # '�� 6
�� 
scpt 6 m   % & 7 7 � 8 8 
 X L i s t��   4  9 : 9 l     ��������  ��  ��   :  ; < ; l      �� = >��   =  * Class Variable *    > � ? ? $ *   C l a s s   V a r i a b l e   * <  @ A @ j   * ,�� B��  0 _promptmessage _promptMessage B m   * + C C � D D  C h o o s e   a n   i t e m A  E F E j   - /�� G�� 0 	_typelist 	_typeList G m   - .��
�� 
msng F  H I H j   0 2�� J�� 0 _suffixlist _suffixList J m   0 1��
�� 
msng I  K L K j   3 5�� M�� (0 _targetapplication _targetApplication M m   3 4��
�� misccura L  N O N j   6 8�� P�� &0 _withresolvealias _withResolveAlias P m   6 7��
�� boovtrue O  Q R Q j   9 ;�� S�� 0 _usechooser _useChooser S m   9 :��
�� boovtrue R  T U T j   < >�� V�� $0 _defaultlocation _defaultLocation V m   < =��
�� 
msng U  W X W j   ? A�� Y�� .0 _useinsertionlocation _useInsertionLocation Y m   ? @��
�� boovfals X  Z [ Z j   B D�� \�� 0 _allow_myself   \ m   B C��
�� boovfals [  ] ^ ] l     ��������  ��  ��   ^  _ ` _ l      �� a b��   a ! * build in chooser script *    b � c c 6 *   b u i l d   i n   c h o o s e r   s c r i p t   * `  d e d i   E H f g f I      �� h���� 0 chooser_for_file   h  i�� i o      ���� 
0 caller  ��  ��   g h     �� j�� 0 filechooser fileChooser j k       k k  l m l j     �� n�� 0 	_delegate   n o     ���� 
0 caller   m  o p o l    X q���� q O     X r s r k    W t t  u v u I   ������
�� .miscactvnull��� ��� null��  ��   v  w�� w O    W x y x k    V z z  { | { r     } ~ } n     �  o    ���� 0 	_typelist 	_typeList �  g     ~ o      ���� 0 	type_list   |  � � � Z    ( � ����� � =    � � � o    ���� 0 	type_list   � m    ��
�� 
msng � r     $ � � � J     "����   � o      ���� 0 	type_list  ��  ��   �  ��� � Z   ) V � ��� � � =  ) . � � � l  ) , ����� � n  ) , � � � o   * ,���� $0 _defaultlocation _defaultLocation �  g   ) *��  ��   � m   , -��
�� 
msng � I  1 @���� �
�� .sysostdfalis    ��� null��   � �� � �
�� 
prmp � n  3 6 � � � o   4 6����  0 _promptmessage _promptMessage �  g   3 4 � �� � �
�� 
ftyp � o   7 8���� 0 	type_list   � �� � �
�� 
mlsl � m   9 :��
�� boovtrue � �� ���
�� 
lfiv � m   ; <��
�� boovfals��  ��   � I  C V���� �
�� .sysostdfalis    ��� null��   � �� � �
�� 
prmp � n  E H � � � o   F H����  0 _promptmessage _promptMessage �  g   E F � �� � �
�� 
ftyp � o   I J���� 0 	type_list   � �� � �
�� 
dflc � n  K N � � � o   L N���� $0 _defaultlocation _defaultLocation �  g   K L � �� � �
�� 
mlsl � m   O P��
�� boovtrue � �� ���
�� 
lfiv � m   Q R��
�� boovfals��  ��   y n    � � � o    ���� 0 	_delegate   �  f    ��   s n     � � � n    � � � o    ���� (0 _targetapplication _targetApplication � o    ���� 0 	_delegate   �  f     ��  ��   p  ��� � l  Y _ ����� � L   Y _ � � l  Y ^ ����� � c   Y ^ � � � 1   Y Z��
�� 
rslt � m   Z ]��
�� 
list��  ��  ��  ��  ��   e  � � � l     ��������  ��  ��   �  � � � i   I L � � � I      �� ����� 0 chooser_for_folder   �  ��� � o      ���� 
0 caller  ��  ��   � h     �� ��� 0 folderchooser folderChooser � k       � �  � � � j     �� ��� 0 	_delegate   � o     ���� 
0 caller   �  � � � l     ��������  ��  ��   �  � � � l    ; ����� � O     ; � � � k   
 : � �  � � � I  
 ����~
�� .miscactvnull��� ��� null�  �~   �  ��} � O    : � � � Z    9 � ��| � � =    � � � n    � � � o    �{�{ $0 _defaultlocation _defaultLocation �  g     � m    �z
�z 
msng � I    )�y�x �
�y .sysostflalis    ��� null�x   � �w ��v
�w 
prmp � n  " % � � � o   # %�u�u  0 _promptmessage _promptMessage �  g   " #�v  �|   � I  , 9�t�s �
�t .sysostflalis    ��� null�s   � �r � �
�r 
prmp � n  . 1 � � � o   / 1�q�q  0 _promptmessage _promptMessage �  g   . / � �p ��o
�p 
dflc � n  2 5 � � � o   3 5�n�n $0 _defaultlocation _defaultLocation �  g   2 3�o   � o    �m�m 0 	_delegate  �}   � n     � � � o    �l�l (0 _targetapplication _targetApplication � o     �k�k 0 	_delegate  ��  ��   �  ��j � l  < @ ��i�h � L   < @ � � l  < ? ��g�f � c   < ? � � � 1   < =�e
�e 
rslt � m   = >�d
�d 
list�g  �f  �i  �h  �j   �  � � � l     �c�b�a�c  �b  �a   �  � � � l      � � � � j   M T�` ��` 0 _chooser   � I   M S�_ ��^�_ 0 chooser_for_file   �  ��] �  f   N O�]  �^   �  	 obsolute    � � � �    o b s o l u t e �  � � � l     �\�[�Z�\  �[  �Z   �  � � � l      �Y � ��Y   �  * picker scripts *    � � � � $ *   p i c k e r   s c r i p t s   * �  � � � i   U X �  � I      �X�W�X 0 base_picker   �V o      �U�U 0 delegate  �V  �W    h     �T�T 0 
basepicker 
BasePicker k        j     �S�S 0 	_delegate   o     �R�R 0 delegate   	 j    	�Q
�Q 0 _is_insertion_location  
 m    �P
�P boovfals	  l     �O�N�M�O  �N  �M    i   
  I      �L�K�J�L 0 finder_selection  �K  �J   O     
 L    	 1    �I
�I 
sele m     �                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��    l     �H�G�F�H  �G  �F    i     I      �E�D�E 0 is_match   �C o      �B�B 0 an_item  �C  �D   L      m     �A
�A boovtrue  l     �@�?�>�@  �?  �>    !  i    "#" I      �=�<�;�= 0 
trash_path  �<  �;  # L     $$ I    �:%�9
�: .earsffdralis        afdr% m     �8
�8 afdrtrsh�9  ! &'& l     �7�6�5�7  �6  �5  ' ()( i    *+* I      �4,�3�4 0 remove_special  , -�2- o      �1�1 
0 a_list  �2  �3  + k     [.. /0/ l     �012�0  1   log "start remove special"   2 �33 4 l o g   " s t a r t   r e m o v e   s p e c i a l "0 454 r     676 n     898 4    �/:
�/ 
cobj: m    �.�. 9 o     �-�- 
0 a_list  7 o      �,�, 0 
a_location  5 ;<; Q    X=>?= k   
 @@ ABA c   
 CDC o   
 �+�+ 0 
a_location  D m    �*
�* 
alisB E�)E r    FGF J    HH I�(I o    �'�' 0 
a_location  �(  G o      �&�& 
0 a_list  �)  > R      �%�$�#
�% .ascrerr ****      � ****�$  �#  ? k    XJJ KLK l   �"MN�"  M  log "error"   N �OO  l o g   " e r r o r "L PQP r    RSR J    �!�!  S o      � �  
0 a_list  Q T�T O     XUVU Z   $ WWX��W l  $ ,Y��Y I  $ ,�Z�
� .coredoexnull���     obj Z 4   $ (�[
� 
brow[ m   & '�� �  �  �  X k   / S\\ ]^] r   / 7_`_ n   / 5aba 1   3 5�
� 
pnamb 4   / 3�c
� 
browc m   1 2�� ` o      �� 
0 a_name  ^ d�d Z   8 Sef��e =  8 ?ghg o   8 9�� 
0 a_name  h n   9 >iji 1   < >�
� 
dnamj 1   9 <�
� 
trshf k   B Okk lml r   B Inon n  B Gpqp I   C G���
� 0 
trash_path  �  �
  q  f   B Co o      �	�	 0 
a_location  m r�r r   J Osts J   J Muu v�v o   J K�� 0 
a_location  �  t o      �� 
0 a_list  �  �  �  �  �  �  V m     !ww�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �  < xyx l  Y Y�z{�  z  
log a_list   { �||  l o g   a _ l i s ty }~} l  Y Y���    log "end remove_special"   � ��� 0 l o g   " e n d   r e m o v e _ s p e c i a l "~ ��� L   Y [�� o   Y Z�� 
0 a_list  �  ) ��� l     � �����   ��  ��  � ��� i    ��� I      �������� 0 is_insertion_location  ��  ��  � L     �� n    ��� o    ���� 0 _is_insertion_location  �  f     � ��� l     ��������  ��  ��  � ���� i    !��� I     ������
�� .aevtoappnull  �   � ****��  ��  � k     n�� ��� l     ������  � # log "start run in BasePicker"   � ��� : l o g   " s t a r t   r u n   i n   B a s e P i c k e r "� ��� r     ��� n    ��� I    ������� 0 	make_with  � ���� I    
�������� 0 finder_selection  ��  ��  ��  ��  � o     ���� 0 xlist XList� o      ���� 0 selected_list  � ��� r    ��� J    ����  � o      ���� 
0 a_list  � ��� l   ��������  ��  ��  � ��� Z    0������ n   ��� o    ���� &0 _withresolvealias _withResolveAlias� o    ���� 0 	_delegate  � h   ! '�����  � i     ��� I      ������� 0 do  � ���� o      ���� 0 an_item  ��  ��  � L     �� c     ��� o     ���� 0 an_item  � m    ��
�� 
alis��  � h   * 0�����  � i     ��� I      ������� 0 do  � ���� o      ���� 0 an_item  ��  ��  � L     �� c     ��� o     ���� 0 an_item  � m    ��
�� 
furl� ��� r   1 4��� 1   1 2��
�� 
rslt� o      ���� 0 
itemfilter 
ItemFilter� ��� l  5 5��������  ��  ��  � ��� V   5 k��� k   ? f�� ��� r   ? O��� n  ? M��� I   D M������� 0 resolve_alias  � ���� n  D I��� I   E I�������� 0 next  ��  ��  � o   D E���� 0 selected_list  ��  ��  � o   ? D���� 0 	_delegate  � o      ���� 0 an_item  � ���� Z   P f������� I   P V������� 0 is_match  � ���� o   Q R���� 0 an_item  ��  ��  � r   Y b��� n  Y _��� I   Z _������� 0 do  � ���� o   Z [���� 0 an_item  ��  ��  � o   Y Z���� 0 
itemfilter 
ItemFilter� n      ���  ;   ` a� o   _ `���� 
0 a_list  ��  ��  ��  � l  9 >������ n  9 >��� I   : >�������� 0 has_next  ��  ��  � o   9 :���� 0 selected_list  ��  ��  � ��� l  l l��������  ��  ��  � ���� L   l n�� o   l m���� 
0 a_list  ��  ��   � ��� l     ��������  ��  ��  � ��� i   Y \��� I      ������� 0 picker_for_file  � ���� o      ���� 
0 caller  ��  ��  � h     ����� 0 
filepicker 
FilePicker� k      �� ��� j     ���
�� 
pare� I     
������� 0 base_picker  � ���� o    ���� 
0 caller  ��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I     ������
�� .aevtoappnull  �   � ****��  ��  � L     �� M     �� I     ������
�� .aevtoappnull  �   � ****��  ��  � ��� l     ��������  ��  ��  � � � i     I      ������ 0 match_class   �� o      ���� 
0 a_path  ��  ��   L      H      D      o     ���� 
0 a_path   m    		 �

  :   l     ��������  ��  ��    i     I      ������ 0 is_match   �� o      ���� 0 an_item  ��  ��   k     4  r      m     ��
�� boovfals o      ���� 0 a_result    r    	 c     o    ���� 0 an_item   m    ��
�� 
utxt o      ���� 
0 a_path    Z   
 1 !����  I   
 ��"���� 0 match_class  " #�# o    �~�~ 
0 a_path  �  ��  ! O    -$%$ r    ,&'& l   *(�}�|( G    *)*) I    �{+�z�{ 0 match_suffix  + ,�y, o    �x�x 
0 a_path  �y  �z  * I   " (�w-�v�w 0 
match_type  - .�u. o   # $�t�t 0 an_item  �u  �v  �}  �|  ' o      �s�s 0 a_result  % n   /0/ o    �r�r 0 	_delegate  0  f    ��  ��   1�q1 L   2 422 o   2 3�p�p 0 a_result  �q   3�o3 l     �n�m�l�n  �m  �l  �o  � 454 l     �k�j�i�k  �j  �i  5 676 i   ] `898 I      �h:�g�h 0 picker_for_item  : ;�f; o      �e�e 
0 caller  �f  �g  9 h     �d<�d 0 
itempicker 
ItemPicker< k      == >?> j     �c@
�c 
pare@ I     
�bA�a�b 0 base_picker  A B�`B o    �_�_ 
0 caller  �`  �a  ? CDC l     �^�]�\�^  �]  �\  D EFE i    GHG I     �[�Z�Y
�[ .aevtoappnull  �   � ****�Z  �Y  H L     II M     JJ I     �X�W�V
�X .aevtoappnull  �   � ****�W  �V  F KLK l     �U�T�S�U  �T  �S  L MNM i    OPO I      �R�Q�P�R 0 finder_selection  �Q  �P  P k     KQQ RSR l     �OTU�O  T 0 *log "start finder_selection of ItemPicker"   U �VV T l o g   " s t a r t   f i n d e r _ s e l e c t i o n   o f   I t e m P i c k e r "S WXW r     	YZY M     [[ I      �N�M�L�N 0 finder_selection  �M  �L  Z o      �K�K 
0 a_list  X \]\ Z   
 3^_�J�I^ F   
 `a` n  
 bcb n   ded I    �H�G�F�H 0 use_insertion_location  �G  �F  e o    �E�E 0 	_delegate  c  f   
 a l   f�D�Cf =   ghg o    �B�B 
0 a_list  h J    �A�A  �D  �C  _ k    /ii jkj O    )lml r   ! (non J   ! &pp q�@q 1   ! $�?
�? 
pins�@  o o      �>�> 
0 a_list  m m    rr�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  k s�=s r   * /tut m   * +�<
�< boovtrueu n     vwv o   , .�;�; 0 _is_insertion_location  w  f   + ,�=  �J  �I  ] xyx Z   4 Hz{�:�9z =  4 9|}| n   4 7~~ 1   5 7�8
�8 
leng o   4 5�7�7 
0 a_list  } m   7 8�6�6 { r   < D��� I   < B�5��4�5 0 remove_special  � ��3� o   = >�2�2 
0 a_list  �3  �4  � o      �1�1 
0 a_list  �:  �9  y ��� l  I I�0���0  � . (log "end finder_selection of ItemPicker"   � ��� P l o g   " e n d   f i n d e r _ s e l e c t i o n   o f   I t e m P i c k e r "� ��/� L   I K�� o   I J�.�. 
0 a_list  �/  N ��� l     �-�,�+�-  �,  �+  � ��� i    ��� I      �*��)�* 0 match_class  � ��(� o      �'�' 0 an_item  �(  �)  � L     �� m     �&
�& boovtrue� ��� l     �%�$�#�%  �$  �#  � ��� i    ��� I      �"��!�" 0 is_match  � �� � o      �� 0 an_item  �   �!  � k     *�� ��� Z    ����� H     �� I     ���� 0 match_class  � ��� o    �� 0 an_item  �  �  � L   
 �� m   
 �
� boovfals�  �  � ��� l   ����  �  �  � ��� O    *��� L    )�� l   (���� G    (��� I    ���� 0 match_suffix  � ��� o    �� 0 an_item  �  �  � I     &���� 0 
match_type  � ��� o   ! "�
�
 0 an_item  �  �  �  �  � n   ��� o    �	�	 0 	_delegate  �  f    �  � ��� l     ����  �  �  �  7 ��� l     ����  �  �  � ��� i   a d��� I      ��� � 0 picker_for_application  � ���� o      ���� 
0 caller  ��  �   � h     ����� &0 applicationpicker ApplicationPicker� k      �� ��� j     ���
�� 
pare� I     
������� 0 base_picker  � ���� o    ���� 
0 caller  ��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I     ������
�� .aevtoappnull  �   � ****��  ��  � L     �� M     �� I     ������
�� .aevtoappnull  �   � ****��  ��  � ��� l     ��������  ��  ��  � ���� i    ��� I      ������� 0 is_match  � ���� o      ���� 0 an_item  ��  ��  � O     ��� L    
�� =   	��� n    ��� m    ��
�� 
pcls� o    ���� 0 an_item  � m    ��
�� 
appf� m     ���                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  � ��� l     ��������  ��  ��  � ��� i   e h��� I      ������� 0 picker_for_folder  � ���� o      ���� 
0 caller  ��  ��  � h     ����� 0 folderpicker FolderPicker� k      �� ��� j     ���
�� 
pare� I     
������� 0 base_picker  � ���� o    ���� 
0 caller  ��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I     ������
�� .aevtoappnull  �   � ****��  ��  � L     �� M     �� I     ������
�� .aevtoappnull  �   � ****��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      �������� 0 finder_selection  ��  ��  � k     K�� ��� r     	��� M     �� I      �������� 0 finder_selection  ��  ��  � o      ���� 
0 a_list  � ��� Z   
 3 ����  F   
  n  
  n    I    �������� 0 use_insertion_location  ��  ��   o    ���� 0 	_delegate    f   
  l   ���� =   	
	 o    ���� 
0 a_list  
 J    ����  ��  ��   k    /  O    ) r   ! ( J   ! & �� 1   ! $��
�� 
pins��   o      ���� 
0 a_list   m    �                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   �� r   * / m   * +��
�� boovtrue n      o   , .���� 0 _is_insertion_location    f   + ,��  ��  ��  �  l  4 4��������  ��  ��    Z   4 H���� =  4 9 !  n   4 7"#" 1   5 7��
�� 
leng# o   4 5���� 
0 a_list  ! m   7 8����  r   < D$%$ I   < B��&���� 0 remove_special  & '��' o   = >���� 
0 a_list  ��  ��  % o      ���� 
0 a_list  ��  ��   (��( L   I K)) o   I J���� 
0 a_list  ��  � *+* l     ��������  ��  ��  + ,-, i    ./. I      ��0���� 0 match_class  0 1��1 o      ���� 0 an_item  ��  ��  / O     232 L    
44 =   	565 n    787 m    ��
�� 
pcls8 o    ���� 0 an_item  6 m    ��
�� 
cfol3 m     99�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  - :;: l     ��������  ��  ��  ; <��< i    =>= I      ��?���� 0 is_match  ? @��@ o      ���� 0 an_item  ��  ��  > L     AA l    B����B F     CDC I     ��E���� 0 match_class  E F��F o    ���� 0 an_item  ��  ��  D n  	 GHG n  
 IJI I    ��K���� 0 match_suffix  K L��L o    ���� 0 an_item  ��  ��  J o   
 ���� 0 	_delegate  H  f   	 
��  ��  ��  � MNM l     ��������  ��  ��  N OPO i   i lQRQ I      ��S���� 0 picker_for_disk  S T��T o      ���� 
0 caller  ��  ��  R h     ��U�� 0 
diskpicker 
DiskPickerU k      VV WXW j     �Y
� 
pareY I     
�~Z�}�~ 0 picker_for_folder  Z [�|[ o    �{�{ 
0 caller  �|  �}  X \]\ l     �z�y�x�z  �y  �x  ] ^_^ i    `a` I     �w�v�u
�w .aevtoappnull  �   � ****�v  �u  a L     bb M     cc I     �t�s�r
�t .aevtoappnull  �   � ****�s  �r  _ ded l     �q�p�o�q  �p  �o  e fgf i    hih I      �nj�m�n 0 match_class  j k�lk o      �k�k 0 an_item  �l  �m  i O     lml L    
nn =   	opo n    qrq m    �j
�j 
pclsr o    �i�i 0 an_item  p m    �h
�h 
cdism m     ss�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  g t�gt l     �f�e�d�f  �e  �d  �g  P uvu l     �c�b�a�c  �b  �a  v wxw i   m pyzy I      �`{�_�` 0 picker_for_container  { |�^| o      �]�] 
0 caller  �^  �_  z h     �\}�\ "0 containerpicker ContainerPicker} k      ~~ � j     �[�
�[ 
pare� I     
�Z��Y�Z 0 picker_for_folder  � ��X� o    �W�W 
0 caller  �X  �Y  � ��� l     �V�U�T�V  �U  �T  � ��� i    ��� I     �S�R�Q
�S .aevtoappnull  �   � ****�R  �Q  � L     �� M     �� I     �P�O�N
�P .aevtoappnull  �   � ****�O  �N  � ��� l     �M�L�K�M  �L  �K  � ��� i    ��� I      �J��I�J 0 match_class  � ��H� o      �G�G 0 an_item  �H  �I  � O     ��� L    �� E   ��� J    �� ��� m    �F
�F 
cfol� ��E� m    �D
�D 
cdis�E  � n    ��� m   	 �C
�C 
pcls� o    	�B�B 0 an_item  � m     ���                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��A� l     �@�?�>�@  �?  �>  �A  x ��� l     �=�<�;�=  �<  �;  � ��� i   q t��� I      �:��9�: 0 picker_for_document  � ��8� o      �7�7 
0 caller  �8  �9  � h     �6��6  0 documentpicker DocumentPicker� k      �� ��� j     �5�
�5 
pare� I     
�4��3�4 0 picker_for_item  � ��2� o    �1�1 
0 caller  �2  �3  � ��� l     �0�/�.�0  �/  �.  � ��� i    ��� I     �-�,�+
�- .aevtoappnull  �   � ****�,  �+  � L     �� M     �� I     �*�)�(
�* .aevtoappnull  �   � ****�)  �(  � ��� l     �'�&�%�'  �&  �%  � ��� i    ��� I      �$��#�$ 0 match_class  � ��"� o      �!�! 0 an_item  �"  �#  � O     ��� L    
�� l   	�� �� =   	��� n    ��� m    �
� 
pcls� o    �� 0 an_item  � m    �
� 
docf�   �  � m     ���                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l     ����  �  �  �  � ��� l     ����  �  �  � ��� i   u x��� I      ���� 0 picker_for_package  � ��� o      �� 
0 caller  �  �  � h     ��� 0 packagepicker PackagePicker� k      �� ��� j     ��
� 
pare� I     
���� 0 picker_for_item  � ��� o    �� 
0 caller  �  �  � ��� l     �
�	��
  �	  �  � ��� i    ��� I      ���� 0 is_match  � ��� o      �� 0 an_item  �  �  � Z     ����� M     �� I      � ����  0 is_match  � ���� o    ���� 0 an_item  ��  ��  � L    �� n    ��� 1    ��
�� 
ispk� l   ������ I   �����
�� .sysonfo4asfe        file� l   ������ c    ��� o    ���� 0 an_item  � m    ��
�� 
alis��  ��  ��  ��  ��  �  �  �  � ��� l     ��������  ��  ��  � ��� j   y ������ 0 _picker  � I   y ������� 0 picker_for_item  � ����  f   z {��  ��  � ��� l     ��������  ��  ��  � ��� l      ������  �  * public handlers *   � ��� & *   p u b l i c   h a n d l e r s   *� ��� l     ��������  ��  ��  � ��� l      ��� ��  � l f!@group Constructors
Generate an instance depending on kind of items you want from Finder's selection
     � � ! @ g r o u p   C o n s t r u c t o r s 
 G e n e r a t e   a n   i n s t a n c e   d e p e n d i n g   o n   k i n d   o f   i t e m s   y o u   w a n t   f r o m   F i n d e r ' s   s e l e c t i o n 
�  i   � � I     ������
�� .corecrel****      � null��  ��   k       r     	
	  f     
 o      ���� 0 a_parent    h    ���� "0 finderselection FinderSelection k        j     ��
�� 
pare o     ���� 0 a_parent    j   	 ���� 0 _picker   m   	 
��
�� 
msng  j    ���� 0 _chooser   m    ��
�� 
msng  j    ���� 0 	_typelist 	_typeList n    o    ���� 0 	_typelist 	_typeList  f      j    ���� 0 _suffixlist _suffixList n    !  o    ���� 0 _suffixlist _suffixList!  f     "#" j     ��$�� $0 _defaultlocation _defaultLocation$ n   %&% o    ���� $0 _defaultlocation _defaultLocation&  f    # '(' j   ! &��)��  0 _promptmessage _promptMessage) n  ! %*+* o   " $����  0 _promptmessage _promptMessage+  f   ! "( ,-, j   ' ,��.�� &0 _withresolvealias _withResolveAlias. n  ' +/0/ o   ( *���� &0 _withresolvealias _withResolveAlias0  f   ' (- 121 j   - 2��3�� (0 _targetapplication _targetApplication3 n  - 1454 o   . 0���� (0 _targetapplication _targetApplication5  f   - .2 676 j   3 8��8�� .0 _useinsertionlocation _useInsertionLocation8 n  3 79:9 o   4 6���� .0 _useinsertionlocation _useInsertionLocation:  f   3 47 ;<; j   9 >��=�� 0 _usechooser _useChooser= n  9 =>?> o   : <���� 0 _usechooser _useChooser?  f   9 :< @��@ j   ? D��A�� 0 _allow_myself  A n  ? CBCB o   @ B���� 0 _allow_myself  C  f   ? @��   DED l   ��������  ��  ��  E F��F L    GG o    ���� "0 finderselection FinderSelection��   HIH l     ��������  ��  ��  I JKJ l      ��LM��  L � �!@abstruct
Genegate an instance to obtain all of selected files and folders in Finder.
@result script object : a new FinderSlection instance
   M �NN ! @ a b s t r u c t 
 G e n e g a t e   a n   i n s t a n c e   t o   o b t a i n   a l l   o f   s e l e c t e d   f i l e s   a n d   f o l d e r s   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
K OPO i   � �QRQ I      �������� 0 make_for_item  ��  ��  R k     SS TUT r     VWV I    ������
�� .corecrel****      � null��  ��  W o      ���� 0 self  U X��X L    YY n   Z[Z I   	 �������� 0 setup_for_item  ��  ��  [ o    	���� 0 self  ��  P \]\ l     ��������  ��  ��  ] ^_^ l      ��`a��  ` � �!@abstruct
Generate an instance to pick up files from selection in Finder.
@result script object : a new FinderSlection instance
   a �bb ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   f i l e s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
_ cdc i   � �efe I      �������� 0 make_for_file  ��  ��  f k     gg hih r     jkj I    ������
�� .corecrel****      � null��  ��  k o      ���� 0 self  i l��l L    mm n   non I   	 �������� 0 setup_for_file  ��  ��  o o    	���� 0 self  ��  d pqp l     ��������  ��  ��  q rsr l      ��tu��  t � �!@abstruct
Generate an instance to pick up documents from selection in Finder.
@result script object : a new FinderSlection instance
   u �vv
 ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   d o c u m e n t s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
s wxw i   � �yzy I      �������� 0 make_for_document  ��  ��  z k     {{ |}| r     ~~ I    ������
�� .corecrel****      � null��  ��   o      ���� 0 self  } ���� L    �� n   ��� I   	 �������� 0 setup_for_document  ��  ��  � o    	���� 0 self  ��  x ��� l     ��������  ��  ��  � ��� l      ������  � � �!@abstruct
Generate an instance to pick up applications from selection in Finder.
@result script object : a new FinderSlection instance
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   a p p l i c a t i o n s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
� ��� i   � ���� I      �������� 0 make_for_application  ��  ��  � k     �� ��� r     ��� I    ������
�� .corecrel****      � null��  ��  � o      ���� 0 self  � ���� L    �� n   ��� I   	 �������� 0 setup_for_application  ��  ��  � o    	���� 0 self  ��  � ��� l     �������  ��  �  � ��� l      �~���~  � � �!@abstruct
Generate an instance to pick up packages from selection in Finder.
@result script object : an instance of FinderSlection
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   p a c k a g e s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �}�|�{�} 0 make_for_package  �|  �{  � k     �� ��� r     ��� I    �z�y�x
�z .corecrel****      � null�y  �x  � o      �w�w 0 self  � ��v� L    �� n   ��� I   	 �u�t�s�u 0 setup_for_package  �t  �s  � o    	�r�r 0 self  �v  � ��� l     �q�p�o�q  �p  �o  � ��� l      �n���n  � � �!@abstruct
Generate an instance to pick up disks or folders from selection in Finder.
@result script object : a new FinderSlection instance
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   d i s k s   o r   f o l d e r s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
� ��� i   � ���� I      �m�l�k�m 0 make_for_container  �l  �k  � k     �� ��� r     ��� I    �j�i�h
�j .corecrel****      � null�i  �h  � o      �g�g 0 self  � ��f� L    �� n   ��� I   	 �e�d�c�e 0 setup_for_container  �d  �c  � o    	�b�b 0 self  �f  � ��� l     �a�`�_�a  �`  �_  � ��� l      �^���^  � � �!@abstruct
Generate an instance to pick up folders from selection in Finder.
@result script object : a new FinderSlection instance
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   f o l d e r s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
� ��� i   � ���� I      �]�\�[�] 0 make_for_folder  �\  �[  � k     �� ��� r     ��� I    �Z�Y�X
�Z .corecrel****      � null�Y  �X  � o      �W�W 0 self  � ��V� L    �� n   ��� I   	 �U�T�S�U 0 setup_for_folder  �T  �S  � o    	�R�R 0 self  �V  � ��� l     �Q�P�O�Q  �P  �O  � ��� l      �N���N  � � �!@abstruct
Generate an instance to pick up disks from selection in Finder.
@result script object : a new FinderSlection instance
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   d i s k s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
� ��� i   � ���� I      �M�L�K�M 0 make_for_disk  �L  �K  � k     �� ��� r     ��� I    �J�I�H
�J .corecrel****      � null�I  �H  � o      �G�G 0 self  � ��F� L    �� n   ��� I   	 �E�D�C�E 0 setup_for_disk  �D  �C  � o    	�B�B 0 self  �F  � ��� l     �A�@�?�A  �@  �?  � ��� l      �>���>  � � �!@group Getting Finder's Selection 

@abstruct Obtain Finder's selection as a list.
@result list of alias : If failed, missing value will be returned.
   � ���. ! @ g r o u p   G e t t i n g   F i n d e r ' s   S e l e c t i o n   
 
 @ a b s t r u c t   O b t a i n   F i n d e r ' s   s e l e c t i o n   a s   a   l i s t . 
 @ r e s u l t   l i s t   o f   a l i a s   :   I f   f a i l e d ,   m i s s i n g   v a l u e   w i l l   b e   r e t u r n e d . 
� ��� i   � ���� I      �=�<�;�= 0 get_selection  �<  �;  � k     P�� ��� l     �:���:  �  log "start get_selection"   � ��� 2 l o g   " s t a r t   g e t _ s e l e c t i o n "� ��� q      �� �9��9 
0 a_list  � �8��8 0 an_item  � �7�6�7 0 n_select  �6  � ��� r     	   I    �5�4
�5 .aevtoappnull  �   � **** n     o    �3�3 0 _picker    f     �4   o      �2�2 
0 a_list  �  l  
 
�1�1   . ( log "after run picker in get_selection"    �		 P   l o g   " a f t e r   r u n   p i c k e r   i n   g e t _ s e l e c t i o n " 

 r   
  n   
  1    �0
�0 
leng o   
 �/�/ 
0 a_list   o      �.�. 0 n_select    Z    M�- =    o    �,�, 0 n_select   m    �+�+   Z    ,�* n    o    �)�) 0 _usechooser _useChooser  f     r    & I   $�(�'
�( .aevtoappnull  �   � **** n      o     �&�& 0 _chooser     f    �'   o      �%�% 
0 a_list  �*   r   ) ,!"! m   ) *�$
�$ 
msng" o      �#�# 
0 a_list   #$# F   / ;%&% l  / 3'�"�!' H   / 3(( n  / 2)*) o   0 2� �  0 _allow_myself  *  f   / 0�"  �!  & l  6 9+��+ =  6 9,-, o   6 7�� 0 n_select  - m   7 8�� �  �  $ .�. r   > I/0/ I   > G�1�� 0 except_myself  1 2�2 n   ? C343 4   @ C�5
� 
cobj5 m   A B�� 4 o   ? @�� 
0 a_list  �  �  0 o      �� 
0 a_list  �  �-   6�6 L   N P77 o   N O�� 
0 a_list  �  � 898 l     ����  �  �  9 :;: l      �<=�  < � �!@abstruct
Return whether an item returned by ((<get_selection>)) is Finder's insertion location or not.
@result boolean : true if retuend item by ((<get_selection>)) is Finder's insertion location.
   = �>>� ! @ a b s t r u c t 
 R e t u r n   w h e t h e r   a n   i t e m   r e t u r n e d   b y   ( ( < g e t _ s e l e c t i o n > ) )   i s   F i n d e r ' s   i n s e r t i o n   l o c a t i o n   o r   n o t . 
 @ r e s u l t   b o o l e a n   :   t r u e   i f   r e t u e n d   i t e m   b y   ( ( < g e t _ s e l e c t i o n > ) )   i s   F i n d e r ' s   i n s e r t i o n   l o c a t i o n . 
; ?@? i   � �ABA I      ���� 0 is_insertion_location  �  �  B L     CC n    DED n   FGF I    �
�	��
 0 is_insertion_location  �	  �  G o    �� 0 _picker  E  f     @ HIH l     ����  �  �  I JKJ l      �LM�  L � �!@group Accessor Methods 

You can customize behaivior of an instance of FinderSlection.
Following three mehods will be frequently used.

* ((<set_types>))
* ((<set_extensions>))
* ((<set_prompt_message>))
   M �NN� ! @ g r o u p   A c c e s s o r   M e t h o d s   
 
 Y o u   c a n   c u s t o m i z e   b e h a i v i o r   o f   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n . 
 F o l l o w i n g   t h r e e   m e h o d s   w i l l   b e   f r e q u e n t l y   u s e d . 
 
 *   ( ( < s e t _ t y p e s > ) ) 
 *   ( ( < s e t _ e x t e n s i o n s > ) ) 
 *   ( ( < s e t _ p r o m p t _ m e s s a g e > ) ) 
K OPO l     ��� �  �  �   P QRQ l      ��ST��  S � �!@abstruct set UTIs or file types of items you want.
@param type_list (list) : list of UTI or file type ex) {"com.apple.traditional-mac-plain-text", "TEXT", "PDF "}
@result script object : me
   T �UU� ! @ a b s t r u c t   s e t   U T I s   o r   f i l e   t y p e s   o f   i t e m s   y o u   w a n t . 
 @ p a r a m   t y p e _ l i s t   ( l i s t )   :   l i s t   o f   U T I   o r   f i l e   t y p e   e x )   { " c o m . a p p l e . t r a d i t i o n a l - m a c - p l a i n - t e x t " ,   " T E X T " ,   " P D F   " } 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
R VWV i   � �XYX I      ��Z���� 0 	set_types  Z [��[ o      ���� 0 	type_list  ��  ��  Y k     \\ ]^] r     _`_ o     ���� 0 	type_list  ` n     aba o    ���� 0 	_typelist 	_typeListb  f    ^ cdc Z    ef����e =   ghg n   	iji o    	���� 0 _suffixlist _suffixListj  f    h m   	 
��
�� 
msngf r    klk J    ����  l n     mnm o    ���� 0 _suffixlist _suffixListn  f    ��  ��  d o��o L    pp  f    ��  W qrq l     ��������  ��  ��  r sts l      ��uv��  u � �!@abstruct Set path extensions of items you want.
@param extenstion_list (list) : a list of path extensions ex) {".rtf", ".pdf"}
@result script object : me
   v �ww8 ! @ a b s t r u c t   S e t   p a t h   e x t e n s i o n s   o f   i t e m s   y o u   w a n t . 
 @ p a r a m   e x t e n s t i o n _ l i s t   ( l i s t )   :   a   l i s t   o f   p a t h   e x t e n s i o n s   e x )   { " . r t f " ,   " . p d f " } 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
t xyx i   � �z{z I      ��|���� 0 set_extensions  | }��} o      ���� 0 extension_list  ��  ��  { k     ~~ � r     ��� o     ���� 0 extension_list  � n     ��� o    ���� 0 _suffixlist _suffixList�  f    � ��� Z    ������� =   ��� n   	��� o    	���� 0 	_typelist 	_typeList�  f    � m   	 
��
�� 
msng� r    ��� J    ����  � n     ��� o    ���� 0 	_typelist 	_typeList�  f    ��  ��  � ���� L    ��  f    ��  y ��� l     ��������  ��  ��  � ��� l      ������  � n h!@abstruct Set a message to displayed in open panel.
@param a_message (text)
@result script object : me
   � ��� � ! @ a b s t r u c t   S e t   a   m e s s a g e   t o   d i s p l a y e d   i n   o p e n   p a n e l . 
 @ p a r a m   a _ m e s s a g e   ( t e x t ) 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
� ��� i   � ���� I      ������� 0 set_prompt_message  � ���� o      ���� 0 	a_message  ��  ��  � k     �� ��� r     ��� o     ���� 0 	a_message  � n     ��� o    ����  0 _promptmessage _promptMessage�  f    � ���� L    ��  f    ��  � ��� l     ��������  ��  ��  � ��� l      ������  � �!@abstruct
Whether open panel will be opened or not when threre are not items matched with the conditions in selection in Finder.
@param a_bool (boolean) : If false is given, open panel is not opened. The default value is true.
@result script object : me
   � ���� ! @ a b s t r u c t 
 W h e t h e r   o p e n   p a n e l   w i l l   b e   o p e n e d   o r   n o t   w h e n   t h r e r e   a r e   n o t   i t e m s   m a t c h e d   w i t h   t h e   c o n d i t i o n s   i n   s e l e c t i o n   i n   F i n d e r . 
 @ p a r a m   a _ b o o l   ( b o o l e a n )   :   I f   f a l s e   i s   g i v e n ,   o p e n   p a n e l   i s   n o t   o p e n e d .   T h e   d e f a u l t   v a l u e   i s   t r u e . 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
� ��� i   � ���� I      ������� 0 set_use_chooser  � ���� o      ���� 
0 a_bool  ��  ��  � k     �� ��� r     ��� o     ���� 
0 a_bool  � n     ��� o    ���� 0 _usechooser _useChooser�  f    � ���� L    ��  f    ��  � ��� l     ��������  ��  ��  � ��� l      ������  �!@abstruct
Whether insertion location is obtained as a selected item or not, when no items are selected in Finder.
@description 
The insertion location is a location where new folder is created by menu item &quote;New folder&quote; of Finder.

This option have effect for instantces which can obtain folders.
For example, instances gengerated by ((<make_for_item>)),((<make_for_folder>)) and so on.

@param a_bool (boolean) : If ture is given, insertion location is obtained. The default value is false.
@result script object : me
   � ���& ! @ a b s t r u c t 
 W h e t h e r   i n s e r t i o n   l o c a t i o n   i s   o b t a i n e d   a s   a   s e l e c t e d   i t e m   o r   n o t ,   w h e n   n o   i t e m s   a r e   s e l e c t e d   i n   F i n d e r . 
 @ d e s c r i p t i o n   
 T h e   i n s e r t i o n   l o c a t i o n   i s   a   l o c a t i o n   w h e r e   n e w   f o l d e r   i s   c r e a t e d   b y   m e n u   i t e m   & q u o t e ; N e w   f o l d e r & q u o t e ;   o f   F i n d e r . 
 
 T h i s   o p t i o n   h a v e   e f f e c t   f o r   i n s t a n t c e s   w h i c h   c a n   o b t a i n   f o l d e r s . 
 F o r   e x a m p l e ,   i n s t a n c e s   g e n g e r a t e d   b y   ( ( < m a k e _ f o r _ i t e m > ) ) , ( ( < m a k e _ f o r _ f o l d e r > ) )   a n d   s o   o n . 
 
 @ p a r a m   a _ b o o l   ( b o o l e a n )   :   I f   t u r e   i s   g i v e n ,   i n s e r t i o n   l o c a t i o n   i s   o b t a i n e d .   T h e   d e f a u l t   v a l u e   i s   f a l s e . 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
� ��� i   � ���� I      ������� 0 set_use_insertion_location  � ���� o      ���� 
0 a_bool  ��  ��  � k     �� ��� r     ��� o     ���� 
0 a_bool  � n     ��� o    ���� .0 _useinsertionlocation _useInsertionLocation�  f    � ���� L    ��  f    ��  � ��� l     ��������  ��  ��  � ��� i   � ���� I      �������� 0 use_insertion_location  ��  ��  � L     �� n    ��� o    ���� .0 _useinsertionlocation _useInsertionLocation�  f     � ��� l     ��������  ��  ��  � ��� l      ������  �A;!@abstruct
If my self(a script or an application running FinderSelection) is selected in Finder, whether my selft is treated as a member of selection or not.

@param a_bool (boolean) : If true is given, the result of ((<get_selection>)) may include the application. The default is false.
@result script object : me
   � ���v ! @ a b s t r u c t 
 I f   m y   s e l f ( a   s c r i p t   o r   a n   a p p l i c a t i o n   r u n n i n g   F i n d e r S e l e c t i o n )   i s   s e l e c t e d   i n   F i n d e r ,   w h e t h e r   m y   s e l f t   i s   t r e a t e d   a s   a   m e m b e r   o f   s e l e c t i o n   o r   n o t . 
 
 @ p a r a m   a _ b o o l   ( b o o l e a n )   :   I f   t r u e   i s   g i v e n ,   t h e   r e s u l t   o f   ( ( < g e t _ s e l e c t i o n > ) )   m a y   i n c l u d e   t h e   a p p l i c a t i o n .   T h e   d e f a u l t   i s   f a l s e . 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
� ��� i   � ���� I      ������� 0 set_allow_myself  � ���� o      ���� 
0 a_bool  ��  ��  � k     �� ��� r     ��� o     ���� 
0 a_bool  � n     ��� o    ���� 0 _allow_myself  �  f    � ���� L    ��  f    ��  � ��� l     ��������  ��  ��  � ��� i   � ���� I      �������� 0 allow_myself  ��  ��  � L     �� n    ��� o    ���� 0 _allow_myself  �  f     � ��� l     ��������  ��  ��  � � � l      ����   � �!@abstruct
Whether original of alias is searched for or not.
@param a_bool (boolean) : If false is given, alias files don't follow original items. The default value is ture.
@result script object : me
    �� ! @ a b s t r u c t 
 W h e t h e r   o r i g i n a l   o f   a l i a s   i s   s e a r c h e d   f o r   o r   n o t . 
 @ p a r a m   a _ b o o l   ( b o o l e a n )   :   I f   f a l s e   i s   g i v e n ,   a l i a s   f i l e s   d o n ' t   f o l l o w   o r i g i n a l   i t e m s .   T h e   d e f a u l t   v a l u e   i s   t u r e . 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
   i   � � I      ������ 0 set_resolve_alias   	��	 o      ���� 
0 a_bool  ��  ��   k     

  r      o     ���� 
0 a_bool   n      o    ���� &0 _withresolvealias _withResolveAlias  f     �� L      f    ��    l     ��������  ��  ��    l      ����   � �!@abstruct
The default location of the open panel which is displayed when no items are selected in Finder.
@param a_location (a reference) : a reference to a folder
@result script object : me
    �� ! @ a b s t r u c t 
 T h e   d e f a u l t   l o c a t i o n   o f   t h e   o p e n   p a n e l   w h i c h   i s   d i s p l a y e d   w h e n   n o   i t e m s   a r e   s e l e c t e d   i n   F i n d e r . 
 @ p a r a m   a _ l o c a t i o n   ( a   r e f e r e n c e )   :   a   r e f e r e n c e   t o   a   f o l d e r 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
  i   � � I      ������ 0 set_default_location   �� o      ���� 0 
a_location  ��  ��   k     
   !"! r     #$# c     %&% o     ���� 0 
a_location  & m    ��
�� 
alis$ n     '(' o    ���� $0 _defaultlocation _defaultLocation(  f    " )��) L    
**  f    	��   +,+ l     ��������  ��  ��  , -.- l      ��/0��  /]W----
@abstruct Finder�@�őI�����ڂ������ꍇ�Ɏ��s����X�N���v�g��ݒ肵�܂��B
@description �ݒ肵���X�N���v�g�̕Ԃ�l�� get_selection �̕Ԃ�l�ɂȂ�܂��B�f�t�H���g�ł͎����I�Ƀt�@�C��/�t�H���_�I���_�C�A���O���J���X�N���v�g���ݒ肳��܂��B�����̏ꍇ�A�J�X�^���ɗ^����K�v�͂Ȃ��ł��B
@param a_script (script object)
@result script object : me
   0 �11� - - - - 
 @ a b s t r u c t   F i n d e r0 0g�xb��v�0Lq!0DX4T0k[��L0Y0�0�0�0�0�0�0��-[�0W0~0Y0 
 @ d e s c r i p t i o n  �-[�0W0_0�0�0�0�0�0n��0�P$0L   g e t _ s e l e c t i o n  0n��0�P$0k0j0�0~0Y00�0�0�0�0�0g0o��R�v�0k0�0�0�0� /0�0�0�0��xb�0�0�0�0�0�0���0O0�0�0�0�0�0L�-[�0U0�0~0Y0Y0O0nX4T00�0�0�0�0kN0H0�_ŉ�0o0j0D0g0Y0 
 @ p a r a m   a _ s c r i p t   ( s c r i p t   o b j e c t ) 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
. 232 i   � �454 I      ��6���� 0 set_chooser  6 7��7 o      ���� 0 a_script  ��  ��  5 k     88 9:9 r     ;<; o     ���� 0 a_script  < n     =>= o    ���� 0 _chooser  >  f    : ?��? L    @@  f    ��  3 ABA l     ��������  ��  ��  B CDC i   � �EFE I      ������� 0 set_chooser_for_folder  ��  �  F k     GG HIH r     
JKJ I     �~L�}�~ 0 chooser_for_folder  L M�|M  f    �|  �}  K n     NON o    	�{�{ 0 _chooser  O  f    I P�zP L    QQ  f    �z  D RSR l     �y�x�w�y  �x  �w  S TUT i   � �VWV I      �v�u�t�v 0 set_chooser_for_file  �u  �t  W k     XX YZY r     
[\[ I     �s]�r�s 0 chooser_for_file  ] ^�q^  f    �q  �r  \ n     _`_ o    	�p�p 0 _chooser  `  f    Z a�oa L    bb  f    �o  U cdc l     �n�m�l�n  �m  �l  d efe i   � �ghg I      �ki�j�k 0 current_picker  i j�ij o      �h�h 0 a_script  �i  �j  h L     kk n    lml o    �g�g 0 _picker  m  f     f non l     �f�e�d�f  �e  �d  o pqp i   � �rsr I      �ct�b�c 0 
set_picker  t u�au o      �`�` 0 a_script  �a  �b  s r     vwv o     �_�_ 0 a_script  w n     xyx o    �^�^ 0 _picker  y  f    q z{z l     �]�\�[�]  �\  �[  { |}| l     �Z�Y�X�Z  �Y  �X  } ~~ l      �W���W  �,&!@group Setup Kind Items to Pick Up 

Change settings of kinds of file and folder to find for instance.
Usually these methods are not required, because these methods are called in constructor methods.

These methods are useful to change settings of an instastance after generating an instance.
   � ���L ! @ g r o u p   S e t u p   K i n d   I t e m s   t o   P i c k   U p   
 
 C h a n g e   s e t t i n g s   o f   k i n d s   o f   f i l e   a n d   f o l d e r   t o   f i n d   f o r   i n s t a n c e . 
 U s u a l l y   t h e s e   m e t h o d s   a r e   n o t   r e q u i r e d ,   b e c a u s e   t h e s e   m e t h o d s   a r e   c a l l e d   i n   c o n s t r u c t o r   m e t h o d s . 
 
 T h e s e   m e t h o d s   a r e   u s e f u l   t o   c h a n g e   s e t t i n g s   o f   a n   i n s t a s t a n c e   a f t e r   g e n e r a t i n g   a n   i n s t a n c e . 
 ��� l     �V�U�T�V  �U  �T  � ��� l     �S�R�Q�S  �R  �Q  � ��� l      �P���P  � i c!@abstruct Make all files and folders targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   a l l   f i l e s   a n d   f o l d e r s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �O�N�M�O 0 setup_for_item  �N  �M  � k     �� ��� r     
��� I     �L��K�L 0 picker_for_item  � ��J�  f    �J  �K  � n     ��� o    	�I�I 0 _picker  �  f    � ��� r    ��� I    �H��G�H 0 chooser_for_file  � ��F�  f    �F  �G  � n     ��� o    �E�E 0 _chooser  �  f    � ��D� L    ��  f    �D  � ��� l     �C�B�A�C  �B  �A  � ��� l      �@���@  � ^ X!@abstruct Make only files targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   o n l y   f i l e s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �?�>�=�? 0 setup_for_file  �>  �=  � k     �� ��� r     
��� I     �<��;�< 0 picker_for_file  � ��:�  f    �:  �;  � n     ��� o    	�9�9 0 _picker  �  f    � ��� r    ��� I    �8��7�8 0 chooser_for_file  � ��6�  f    �6  �7  � n     ��� o    �5�5 0 _chooser  �  f    � ��4� L    ��  f    �4  � ��� l     �3�2�1�3  �2  �1  � ��� l      �0���0  � g a!@abstruct Make only document files targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   o n l y   d o c u m e n t   f i l e s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �/�.�-�/ 0 setup_for_document  �.  �-  � k     �� ��� r     
��� I     �,��+�, 0 picker_for_document  � ��*�  f    �*  �+  � n     ��� o    	�)�) 0 _picker  �  f    � ��� r    ��� I    �(��'�( 0 chooser_for_file  � ��&�  f    �&  �'  � n     ��� o    �%�% 0 _chooser  �  f    � ��$� L    ��  f    �$  � ��� l     �#�"�!�#  �"  �!  � ��� l      � ���   � e _!@abstruct Make only applications targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   o n l y   a p p l i c a t i o n s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      ���� 0 setup_for_application  �  �  � k     �� ��� r     
��� I     ���� 0 picker_for_application  � ���  f    �  �  � n     ��� o    	�� 0 _picker  �  f    � ��� r    ��� I    ���� 0 chooser_for_file  � ���  f    �  �  � n     ��� o    �� 0 _chooser  �  f    � ��� L    ��  f    �  � ��� l     ����  �  �  � � � l      ��   a [!@abstruct Make only packages targets.
@result a reference : an instance of FinderSlection
    � � ! @ a b s t r u c t   M a k e   o n l y   p a c k a g e s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
   i   � � I      ���� 0 setup_for_package  �  �   k      	
	 r     
 I     ��� 0 picker_for_package   �
  f    �
  �   n      o    	�	�	 0 _picker    f    
  r     I    ��� 0 chooser_for_file   �  f    �  �   n      o    �� 0 _chooser    f     � L      f    �    l     ����  �  �    l      �  �    r l!@abstruct
Make containers (disks and folders) targets.
@result a reference : an instance of FinderSlection
     �!! � ! @ a b s t r u c t 
 M a k e   c o n t a i n e r s   ( d i s k s   a n d   f o l d e r s )   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
 "#" i   �$%$ I      �������� 0 setup_for_container  ��  ��  % k     && '(' r     
)*) I     ��+���� 0 picker_for_container  + ,��,  f    ��  ��  * n     -.- o    	���� 0 _picker  .  f    ( /0/ r    121 I    ��3���� 0 chooser_for_folder  3 4��4  f    ��  ��  2 n     565 o    ���� 0 _chooser  6  f    0 7��7 L    88  f    ��  # 9:9 l     ��������  ��  ��  : ;<; l      ��=>��  = ` Z!@abstruct Make only folders targets.
@result a reference : an instance of FinderSlection
   > �?? � ! @ a b s t r u c t   M a k e   o n l y   f o l d e r s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
< @A@ i  BCB I      �������� 0 setup_for_folder  ��  ��  C k     DD EFE r     
GHG I     ��I���� 0 picker_for_folder  I J��J  f    ��  ��  H n     KLK o    	���� 0 _picker  L  f    F MNM r    OPO I    ��Q���� 0 chooser_for_folder  Q R��R  f    ��  ��  P n     STS o    ���� 0 _chooser  T  f    N U��U L    VV  f    ��  A WXW l     ��������  ��  ��  X YZY l      ��[\��  [ ^ X!@abstruct Make only disks targets.
@result a reference : an instance of FinderSlection
   \ �]] � ! @ a b s t r u c t   M a k e   o n l y   d i s k s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
Z ^_^ i  
`a` I      �������� 0 setup_for_disk  ��  ��  a k     .bb cdc r     
efe I     ��g���� 0 picker_for_disk  g h��h  f    ��  ��  f n     iji o    	���� 0 _picker  j  f    d klk r    mnm I    ��o���� 0 chooser_for_folder  o p��p  f    ��  ��  n n     qrq o    ���� 0 _chooser  r  f    l sts Z    +uv����u =   wxw n   yzy o    ���� $0 _defaultlocation _defaultLocationz  f    x m    ��
�� 
msngv I    '��{���� 0 set_default_location  { |��| 4    #��}
�� 
psxf} l  ! "~����~ e   ! " m   ! "�� ���  /��  ��  ��  ��  ��  ��  t ���� L   , .��  f   , -��  _ ��� l     ��������  ��  ��  � ��� l      ������  � � �!@group Utility Handlers@abstruct
Whether the passed item is identical to the result of &quote;path to me&quote; or &quote;path to current application&quote;.
@param an_item (reference) : a reference to file or folder
@result boolean
   � ���� ! @ g r o u p   U t i l i t y   H a n d l e r s   @ a b s t r u c t 
 W h e t h e r   t h e   p a s s e d   i t e m   i s   i d e n t i c a l   t o   t h e   r e s u l t   o f   & q u o t e ; p a t h   t o   m e & q u o t e ;   o r   & q u o t e ; p a t h   t o   c u r r e n t   a p p l i c a t i o n & q u o t e ; . 
 @ p a r a m   a n _ i t e m   ( r e f e r e n c e )   :   a   r e f e r e n c e   t o   f i l e   o r   f o l d e r 
 @ r e s u l t   b o o l e a n 
� ��� i  ��� I      ������� 0 is_same_to_me  � ���� o      ���� 0 an_item  ��  ��  � k     (�� ��� l     ������  �  log "start is_same_to_me"   � ��� 2 l o g   " s t a r t   i s _ s a m e _ t o _ m e "� ��� Q     ���� r    
��� I   �����
�� .earsffdralis        afdr�  f    ��  � o      ���� 0 my_self  � R      ������
�� .ascrerr ****      � ****��  ��  � r    ��� I   �����
�� .earsffdralis        afdr� m    ��
�� misccura��  � o      ���� 0 my_self  � ���� L    (�� l   '������ =   '��� I     ������� 0 
canon_path  � ���� o    ���� 0 my_self  ��  ��  � I     &������� 0 
canon_path  � ���� o   ! "���� 0 an_item  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l      ������  �  = private handlers     � ��� ( =   p r i v a t e   h a n d l e r s    � ��� l     ��������  ��  ��  � ��� l      ������  � # == delegate of picker script    � ��� : = =   d e l e g a t e   o f   p i c k e r   s c r i p t  � ��� l     ��������  ��  ��  � ��� i  ��� I      ������� 0 
match_type  � ���� o      ���� 0 an_item  ��  ��  � k     g�� ��� Z     ������� E    ��� m     ��
�� 
msng� n   ��� o    ���� 0 	_typelist 	_typeList�  f    � L    
�� m    	��
�� boovtrue��  ��  � ��� l   ��������  ��  ��  � ��� Z    ������� =   ��� n   ��� o    ���� 0 	_typelist 	_typeList�  f    � J    ����  � L    �� m    ��
�� boovfals��  ��  � ��� l   ��������  ��  ��  � ��� r    *��� I   (����
�� .sysonfo4asfe        file� l   "������ c    "��� o     ���� 0 an_item  � m     !��
�� 
alis��  ��  � �����
�� 
ptsz� m   # $��
�� boovfals��  � o      ���� 0 fileinfo  � ��� l  + +��������  ��  ��  � ��� Q   + G����� Z   . >����~� l  . 5��}�|� E  . 5��� n  . 1��� o   / 1�{�{ 0 	_typelist 	_typeList�  f   . /� n   1 4��� 1   2 4�z
�z 
utid� o   1 2�y�y 0 fileinfo  �}  �|  � L   8 :�� m   8 9�x
�x boovtrue�  �~  � R      �w�v�u
�w .ascrerr ****      � ****�v  �u  ��  � ��� Q   H d���t� Z   K [���s�r� l  K R��q�p� E  K R��� n  K N��� o   L N�o�o 0 	_typelist 	_typeList�  f   K L� n   N Q��� 1   O Q�n
�n 
asty� o   N O�m�m 0 fileinfo  �q  �p  � L   U W�� m   U V�l
�l boovtrue�s  �r  � R      �k�j�i
�k .ascrerr ****      � ****�j  �i  �t  �    l  e e�h�g�f�h  �g  �f   �e L   e g m   e f�d
�d boovfals�e  �  l     �c�b�a�c  �b  �a    i  	 I      �`
�_�` 0 match_suffix  
 �^ o      �]�] 0 an_item  �^  �_  	 l    j k     j  Z     �\�[ =     n     o    �Z�Z 0 _suffixlist _suffixList  f      m    �Y
�Y 
msng L    
 m    	�X
�X boovtrue�\  �[    l   �W�V�U�W  �V  �U    Z    �T�S =     n   !"! o    �R�R 0 _suffixlist _suffixList"  f      J    �Q�Q   L    ## m    �P
�P boovfals�T  �S   $%$ l   �O�N�M�O  �N  �M  % &'& r    "()( m     �L
�L boovfals) o      �K�K 0 a_result  ' *+* r   # (,-, c   # &./. o   # $�J�J 0 an_item  / m   $ %�I
�I 
utxt- o      �H�H 
0 a_path  + 010 Z   ) @23�G�F2 D   ) ,454 o   ) *�E�E 
0 a_path  5 m   * +66 �77  :3 r   / <898 n   / ::;: 7  0 :�D<=
�D 
ctxt< m   4 6�C�C = m   7 9�B�B��; o   / 0�A�A 
0 a_path  9 o      �@�@ 
0 a_path  �G  �F  1 >?> X   A g@�?A@ Z   S bBC�>�=B l  S VD�<�;D D   S VEFE o   S T�:�: 
0 a_path  F o   T U�9�9 0 a_suffix  �<  �;  C k   Y ^GG HIH r   Y \JKJ m   Y Z�8
�8 boovtrueK o      �7�7 0 a_result  I L�6L  S   ] ^�6  �>  �=  �? 0 a_suffix  A n  D GMNM o   E G�5�5 0 _suffixlist _suffixListN  f   D E? OPO l  h h�4�3�2�4  �3  �2  P Q�1Q L   h jRR o   h i�0�0 0 a_result  �1   #  an_path must be unicode text    �SS :   a n _ p a t h   m u s t   b e   u n i c o d e   t e x t TUT l     �/�.�-�/  �.  �-  U VWV i  XYX I      �,Z�+�, 0 resolve_alias  Z [�*[ o      �)�) 0 an_item  �*  �+  Y k     .\\ ]^] O     +_`_ Z    *ab�(�'a F    cdc n   efe o    �&�& &0 _withresolvealias _withResolveAliasf  f    d l   g�%�$g =   hih n    jkj m    �#
�# 
pclsk o    �"�" 0 an_item  i m    �!
�! 
alia�%  �$  b Q    &lm� l r    non n    pqp 1    �
� 
origq o    �� 0 an_item  o o      �� 0 an_item  m R      ���
� .ascrerr ****      � ****�  �  �   �(  �'  ` m     rr�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ^ s�s L   , .tt o   , -�� 0 an_item  �  W uvu l     ����  �  �  v wxw l      �yz�  y  
== othres    z �{{  = =   o t h r e s  x |}| i  ~~ I      ���� 0 
canon_path  � ��� o      �� 0 an_item  �  �   k     (�� ��� l     ����  �  log "start canon_path"   � ��� , l o g   " s t a r t   c a n o n _ p a t h "� ��� r     ��� n     ��� 1    �
� 
psxp� o     �� 0 an_item  � o      �� 
0 a_path  � ��� Z    %����
� F    ��� l   	��	�� >   	��� o    �� 
0 a_path  � m    �� ���  /�	  �  � l   ���� D    ��� o    �� 
0 a_path  � m    �� ���  /�  �  � r    !��� n    ��� 7   ���
� 
ctxt� m    �� � m    ����� o    � �  
0 a_path  � o      ���� 
0 a_path  �  �
  � ���� L   & (�� o   & '���� 
0 a_path  ��  } ��� l     ��������  ��  ��  � ��� i  "��� I      ������� 0 is_same_path  � ��� o      ���� 	0 item1  � ���� o      ���� 	0 item2  ��  ��  � L     �� l    ������ =    ��� I     ������� 0 
canon_path  � ���� o    ���� 	0 item1  ��  ��  � I    ������� 0 
canon_path  � ���� o    ���� 	0 item2  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i  #&��� I      ������� 0 except_myself  � ���� o      ���� 0 an_item  ��  ��  � k     $�� ��� l     ������  �  log "start except_myself"   � ��� 2 l o g   " s t a r t   e x c e p t _ m y s e l f "� ���� Z     $������ I     ������� 0 is_same_to_me  � ���� o    ���� 0 an_item  ��  ��  � Z   	 ������ n  	 ��� o   
 ���� 0 _usechooser _useChooser�  f   	 
� k    �� ��� l   ������  � / )log "before run chooser in except_myself"   � ��� R l o g   " b e f o r e   r u n   c h o o s e r   i n   e x c e p t _ m y s e l f "� ���� L    �� I   �����
�� .aevtoappnull  �   � ****� n   ��� o    ���� 0 _chooser  �  f    ��  ��  ��  � L    �� m    ��
�� 
msng��  � L     $�� J     #�� ���� o     !���� 0 an_item  ��  ��  � ��� l     ��������  ��  ��  � ��� i  '*��� I      �������� 	0 debug  ��  ��  � k     +�� ��� l     ������  � ! boot (module loader) for me   � ��� 6 b o o t   ( m o d u l e   l o a d e r )   f o r   m e� ��� l     ������  � * $set item_picker to make_for_folder()   � ��� H s e t   i t e m _ p i c k e r   t o   m a k e _ f o r _ f o l d e r ( )� ��� r     ��� I     �������� 0 make_for_item  ��  ��  � o      ���� 0 item_picker  � ��� O    (��� k    '�� ��� I    �������� 0 set_chooser_for_folder  ��  ��  � ��� I    ������� 0 set_prompt_message  � ���� m    	 	  �		 : C h o o s e   a   d i s k   o f   a   d i s k   i m a g e��  ��  � 			 I    ��	���� 0 set_use_insertion_location  	 	��	 m    ��
�� boovtrue��  ��  	 	��	 r     '			 I     %�������� 0 get_selection  ��  ��  	 o      ���� 
0 a_list  ��  � o    	���� 0 item_picker  � 			
		 l  ) )��		��  	  
log a_list   	 �		  l o g   a _ l i s t	
 	��	 L   ) +		 o   ) *���� 
0 a_list  ��  � 			 l     ��������  ��  ��  	 			 i  +.			 I      �������� 0 debug_folder  ��  ��  	 k     )		 			 l     ��		��  	 ! boot (module loader) for me   	 �		 6 b o o t   ( m o d u l e   l o a d e r )   f o r   m e	 	��	 O     )			 k    (		 	 	!	  l   ��	"	#��  	"  tell make_for_container()   	# �	$	$ 2 t e l l   m a k e _ f o r _ c o n t a i n e r ( )	! 	%	&	% l   ��	'	(��  	'  tell make_for_folder()   	( �	)	) , t e l l   m a k e _ f o r _ f o l d e r ( )	& 	*	+	* l   ��	,	-��  	, 9 3set_prompt_message("Choose text file or PDF file.")   	- �	.	. f s e t _ p r o m p t _ m e s s a g e ( " C h o o s e   t e x t   f i l e   o r   P D F   f i l e . " )	+ 	/	0	/ l   ��	1	2��  	1 ! set_types({"TEXT", "PDF "})   	2 �	3	3 6 s e t _ t y p e s ( { " T E X T " ,   " P D F   " } )	0 	4	5	4 l   ��	6	7��  	6 &  set_extensions({"tion", ".pdf"})   	7 �	8	8 @ s e t _ e x t e n s i o n s ( { " t i o n " ,   " . p d f " } )	5 	9	:	9 I   ��	;��
�� .ascrcmnt****      � ****	; b    	<	=	< m    		>	> �	?	? H b e f o r e   s e t _ u s e _ i n s e r t i o n _ l o c a t i o n   :  	= l  	 	@����	@ n   	 	A	B	A o   
 ���� .0 _useinsertionlocation _useInsertionLocation	B  g   	 
��  ��  ��  	: 	C	D	C I    ��	E���� 0 set_use_insertion_location  	E 	F��	F m    ��
�� boovtrue��  ��  	D 	G	H	G I   "��	I��
�� .ascrcmnt****      � ****	I b    	J	K	J m    	L	L �	M	M F a f t e r   s e t _ u s e _ i n s e r t i o n _ l o c a t i o n   :  	K l   	N����	N n    	O	P	O o    ���� .0 _useinsertionlocation _useInsertionLocation	P  g    ��  ��  ��  	H 	Q��	Q I   # (�������� 0 get_selection  ��  ��  ��  	 I     �������� 0 make_for_item  ��  ��  ��  	 	R	S	R l     ��������  ��  ��  	S 	T	U	T i  /2	V	W	V I      �������� 0 debug_document  ��  ��  	W O     	X	Y	X k    	Z	Z 	[	\	[ I    ��	]���� 0 set_prompt_message  	] 	^��	^ m   	 
	_	_ �	`	` : C h o o s e   t e x t   f i l e   o r   P D F   f i l e .��  ��  	\ 	a	b	a l   ��	c	d��  	c  set_resolve_alias(false)   	d �	e	e 0 s e t _ r e s o l v e _ a l i a s ( f a l s e )	b 	f��	f I   ��	g��
�� .ascrcmnt****      � ****	g I    �������� 0 get_selection  ��  ��  ��  ��  	Y I     ������� 0 make_for_document  ��  �  	U 	h	i	h l     �~�}�|�~  �}  �|  	i 	j	k	j i  36	l	m	l I      �{�z�y�{ 0 open_helpbook  �z  �y  	m Q     ,	n	o	p	n O   	q	r	q I   
 �x	s�w�x 0 do  	s 	t�v	t I   �u	u�t
�u .earsffdralis        afdr	u  f    �t  �v  �w  	r 4    �s	v
�s 
scpt	v m    	w	w �	x	x  O p e n H e l p B o o k	o R      �r	y	z
�r .ascrerr ****      � ****	y o      �q�q 0 msg  	z �p	{�o
�p 
errn	{ o      �n�n 	0 errno  �o  	p k    ,	|	| 	}	~	} I   "�m�l�k
�m .miscactvnull��� ��� null�l  �k  	~ 	�j	 I  # ,�i	��h
�i .sysodisAaleR        TEXT	� l  # (	��g�f	� b   # (	�	�	� b   # &	�	�	� o   # $�e�e 0 msg  	� o   $ %�d
�d 
ret 	� o   & '�c�c 	0 errno  �g  �f  �h  �j  	k 	�	�	� l     �b�a�`�b  �a  �`  	� 	�	�	� i  7:	�	�	� I     �_�^�]
�_ .aevtoappnull  �   � ****�^  �]  	� k     	�	� 	�	�	� l     �\	�	��\  	�  return debug()   	� �	�	�  r e t u r n   d e b u g ( )	� 	�	�	� l     �[	�	��[  	�  return debug_folder()   	� �	�	� * r e t u r n   d e b u g _ f o l d e r ( )	� 	�	�	� l     �Z	�	��Z  	�  return debug_document()   	� �	�	� . r e t u r n   d e b u g _ d o c u m e n t ( )	� 	��Y	� I     �X�W�V�X 0 open_helpbook  �W  �V  �Y  	� 	��U	� l     �T�S�R�T  �S  �R  �U       I�Q	� 	�	� C�P�O�N�M�L�K�J�I	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	��Q  	� G�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����������������������
�	�������
�H 
pnam
�G 
pimr�F 0 xlist XList�E  0 _promptmessage _promptMessage�D 0 	_typelist 	_typeList�C 0 _suffixlist _suffixList�B (0 _targetapplication _targetApplication�A &0 _withresolvealias _withResolveAlias�@ 0 _usechooser _useChooser�? $0 _defaultlocation _defaultLocation�> .0 _useinsertionlocation _useInsertionLocation�= 0 _allow_myself  �< 0 chooser_for_file  �; 0 chooser_for_folder  �: 0 _chooser  �9 0 base_picker  �8 0 picker_for_file  �7 0 picker_for_item  �6 0 picker_for_application  �5 0 picker_for_folder  �4 0 picker_for_disk  �3 0 picker_for_container  �2 0 picker_for_document  �1 0 picker_for_package  �0 0 _picker  
�/ .corecrel****      � null�. 0 make_for_item  �- 0 make_for_file  �, 0 make_for_document  �+ 0 make_for_application  �* 0 make_for_package  �) 0 make_for_container  �( 0 make_for_folder  �' 0 make_for_disk  �& 0 get_selection  �% 0 is_insertion_location  �$ 0 	set_types  �# 0 set_extensions  �" 0 set_prompt_message  �! 0 set_use_chooser  �  0 set_use_insertion_location  � 0 use_insertion_location  � 0 set_allow_myself  � 0 allow_myself  � 0 set_resolve_alias  � 0 set_default_location  � 0 set_chooser  � 0 set_chooser_for_folder  � 0 set_chooser_for_file  � 0 current_picker  � 0 
set_picker  � 0 setup_for_item  � 0 setup_for_file  � 0 setup_for_document  � 0 setup_for_application  � 0 setup_for_package  � 0 setup_for_container  � 0 setup_for_folder  � 0 setup_for_disk  � 0 is_same_to_me  � 0 
match_type  � 0 match_suffix  �
 0 resolve_alias  �	 0 
canon_path  � 0 is_same_path  � 0 except_myself  � 	0 debug  � 0 debug_folder  � 0 debug_document  � 0 open_helpbook  
� .aevtoappnull  �   � ****	� �	�� 	�  	�	�	�	� �  .��
�  
vers��  	� ��	���
�� 
cobj	� 	�	�   ��
�� 
osax��  	� ��	���
�� 
cobj	� 	�	�   �� 7
�� 
scpt��  	� 	�	�   �� 7
�� 
scpt
�P 
msng
�O 
msng
�N misccura
�M boovtrue
�L boovtrue
�K 
msng
�J boovfals
�I boovfals	� �� g����	�	����� 0 chooser_for_file  �� ��	��� 	�  ���� 
0 caller  ��  	� ������ 
0 caller  �� 0 filechooser fileChooser	� �� j	��� 0 filechooser fileChooser	� ��	�����	�	���
�� .ascrinit****      � ****	� k     
	�	�  l	�	� 	���	� i    
	�	�	� I      ������
�� .aevtoappnull  �   � ****��  ��  	� k     _	�	�  o	�	�  �����  ��  ��  ��  	� ������ 0 	_delegate  
�� .aevtoappnull  �   � ****	� ��	��� 0 	_delegate  	� ��	�����	�	���
�� .aevtoappnull  �   � ****��  ��  	� ���� 0 	type_list  	� ������������������������������������ 0 	_delegate  �� (0 _targetapplication _targetApplication
�� .miscactvnull��� ��� null�� 0 	_typelist 	_typeList
�� 
msng�� $0 _defaultlocation _defaultLocation
�� 
prmp��  0 _promptmessage _promptMessage
�� 
ftyp
�� 
mlsl
�� 
lfiv�� 
�� .sysostdfalis    ��� null
�� 
dflc�� 

�� 
rslt
�� 
list�� `)�,�, Q*j O)�, D*�,E�O��  	jvE�Y hO*�,�  *�*�,��e�f� Y *�*�,��*�,�e�f� UUO�a &�� b   �OL �� ��K S�	� �� �����	�	����� 0 chooser_for_folder  �� ��	��� 	�  ���� 
0 caller  ��  	� ������ 
0 caller  �� 0 folderchooser folderChooser	� �� �	��� 0 folderchooser folderChooser	� ��	�����	�	���
�� .ascrinit****      � ****	� k     
	�	�  �	�	� 	���	� i    

 

  I      ������
�� .aevtoappnull  �   � ****��  ��  
 k     @

  �

  �����  ��  ��  ��  	� ������ 0 	_delegate  
�� .aevtoappnull  �   � ****	� ��
�� 0 	_delegate  
 ��
����

��
�� .aevtoappnull  �   � ****��  ��  
  
 ������������������������ (0 _targetapplication _targetApplication
�� .miscactvnull��� ��� null�� $0 _defaultlocation _defaultLocation
�� 
msng
�� 
prmp��  0 _promptmessage _promptMessage
�� .sysostflalis    ��� null
�� 
dflc�� 
�� 
rslt
�� 
list�� Ab   �, 2*j Ob    #*�,�  *�*�,l Y *�*�,�*�,� UUO��&�� b   �OL �� ��K S�	� �� j  
�� 0 filechooser fileChooser
 
	�  	�
  	�  	�	� �� ����
	

���� 0 base_picker  �� ��
�� 
  ���� 0 delegate  ��  
	 ������ 0 delegate  �� 0 
basepicker 
BasePicker

 ��
�� 0 
basepicker 
BasePicker
 ��
����

��
�� .ascrinit****      � ****
 k     !

 

 

 

 

  

 (

 �

 �����  ��  ��  
 ������������������ 0 	_delegate  �� 0 _is_insertion_location  �� 0 finder_selection  �� 0 is_match  �� 0 
trash_path  �� 0 remove_special  �� 0 is_insertion_location  
�� .aevtoappnull  �   � ****
 ����





�� 0 	_delegate  �� 0 _is_insertion_location  
 ������

���� 0 finder_selection  ��  ��  
  
 ��
�� 
sele�� � *�,EU
 ������
 
!���� 0 is_match  �� ��
"�� 
"  ���� 0 an_item  ��  
  ���� 0 an_item  
!  �� e
 ��#����
#
$���� 0 
trash_path  ��  ��  
#  
$ ��~
� afdrtrsh
�~ .earsffdralis        afdr�� �j 
 �}+�|�{
%
&�z�} 0 remove_special  �| �y
'�y 
'  �x�x 
0 a_list  �{  
% �w�v�u�w 
0 a_list  �v 0 
a_location  �u 
0 a_name  
& �t�s�r�qw�p�o�n�m�l�k
�t 
cobj
�s 
alis�r  �q  
�p 
brow
�o .coredoexnull���     obj 
�n 
pnam
�m 
trsh
�l 
dnam�k 0 
trash_path  �z \��k/E�O ��&O�kvE�W DX  jvE�O� 5*�k/j  )*�k/�,E�O�*�,�,  )j+ 
E�O�kvE�Y hY hUO�
 �j��i�h
(
)�g�j 0 is_insertion_location  �i  �h  
(  
) �f�f 0 _is_insertion_location  �g )�,E
 �e��d�c
*
+�b
�e .aevtoappnull  �   � ****�d  �c  
* �a�`�_�^�a 0 selected_list  �` 
0 a_list  �_ 0 
itemfilter 
ItemFilter�^ 0 an_item  
+ �]�\�[�
,�
-�Z�Y�X�W�V�U�] 0 finder_selection  �\ 0 	make_with  �[ &0 _withresolvealias _withResolveAlias
, �T
.�S�R
/
0�Q
�T .ascrinit****      � ****
. k     
1
1 ��P�P  �S  �R  
/ �O�O 0 do  
0 
2
2 �N��M�L
3
4�K�N 0 do  �M �J
5�J 
5  �I�I 0 an_item  �L  
3 �H�H 0 an_item  
4 �G
�G 
alis�K ��&�Q L  
- �F
6�E�D
7
8�C
�F .ascrinit****      � ****
6 k     
9
9 ��B�B  �E  �D  
7 �A�A 0 do  
8 
:
: �@��?�>
;
<�=�@ 0 do  �? �<
=�< 
=  �;�; 0 an_item  �>  
; �:�: 0 an_item  
< �9
�9 
furl�= ��&�C L  
�Z 
rslt�Y 0 has_next  �X 0 next  �W 0 resolve_alias  �V 0 is_match  �U 0 do  �b ob  *j+  k+ E�OjvE�Ob   �,E h�K SY h�K SO�E�O 5h�j+ b   �j+ 	k+ 
E�O*�k+  ��k+ �6FY h[OY��O��� "b   �Of�OL OL OL OL OL OL �� ��K S�	� �8��7�6
>
?�5�8 0 picker_for_file  �7 �4
@�4 
@  �3�3 
0 caller  �6  
> �2�1�2 
0 caller  �1 0 
filepicker 
FilePicker
? �0�
A�0 0 
filepicker 
FilePicker
A �/
B�.�-
C
D�,
�/ .ascrinit****      � ****
B k     
E
E �
F
F �
G
G �
H
H �+�+  �.  �-  
C �*�)�(�'
�* 
pare
�) .aevtoappnull  �   � ****�( 0 match_class  �' 0 is_match  
D �&�%
I
J
K�& 0 base_picker  
�% 
pare
I �$��#�"
L
M�!
�$ .aevtoappnull  �   � ****�#  �"  
L  
M � 
�  .aevtoappnull  �   � ****�! 	)jd*  
J ���
N
O�� 0 match_class  � �
P� 
P  �� 
0 a_path  �  
N �� 
0 a_path  
O 	� ��
K ���
Q
R�� 0 is_match  � �
S� 
S  �� 0 an_item  �  
Q ���� 0 an_item  � 0 a_result  � 
0 a_path  
R ������

� 
utxt� 0 match_class  � 0 	_delegate  � 0 match_suffix  � 0 
match_type  
�
 
bool� 5fE�O��&E�O*�k+  )�, *�k+ 
 
*�k+ �&E�UY hO��, *b   k+  N OL OL OL �5 ��K S�	� �	9��
T
U��	 0 picker_for_item  � �
V� 
V  �� 
0 caller  �  
T ��� 
0 caller  � 0 
itempicker 
ItemPicker
U �<
W� 0 
itempicker 
ItemPicker
W � 
X����
Y
Z��
�  .ascrinit****      � ****
X k     
[
[ >
\
\ E
]
] M
^
^ �
_
_ �����  ��  ��  
Y ����������
�� 
pare
�� .aevtoappnull  �   � ****�� 0 finder_selection  �� 0 match_class  �� 0 is_match  
Z ����
`
a
b
c�� 0 base_picker  
�� 
pare
` ��H����
d
e��
�� .aevtoappnull  �   � ****��  ��  
d  
e ��
�� .aevtoappnull  �   � ****�� 	)jd*  
a ��P����
f
g���� 0 finder_selection  ��  ��  
f ���� 
0 a_list  
g 	��������r���������� 0 finder_selection  �� 0 	_delegate  �� 0 use_insertion_location  
�� 
bool
�� 
pins�� 0 _is_insertion_location  
�� 
leng�� 0 remove_special  �� L)jd*  E�O)�,j+ 	 �jv �& � 	*�,kvE�UOe)�,FY hO��,k  *�k+ E�Y hO�
b �������
h
i���� 0 match_class  �� ��
j�� 
j  ���� 0 an_item  ��  
h ���� 0 an_item  
i  �� e
c �������
k
l���� 0 is_match  �� ��
m�� 
m  ���� 0 an_item  ��  
k ���� 0 an_item  
l ������������ 0 match_class  �� 0 	_delegate  �� 0 match_suffix  �� 0 
match_type  
�� 
bool�� +*�k+   fY hO)�, *�k+ 
 
*�k+ �&U�� *b   k+  N OL OL OL OL � ��K S�	� �������
n
o���� 0 picker_for_application  �� ��
p�� 
p  ���� 
0 caller  ��  
n ������ 
0 caller  �� &0 applicationpicker ApplicationPicker
o ���
q�� &0 applicationpicker ApplicationPicker
q ��
r����
s
t��
�� .ascrinit****      � ****
r k     
u
u �
v
v �
w
w �����  ��  ��  
s ������
�� 
pare
�� .aevtoappnull  �   � ****�� 0 is_match  
t ����
x
y�� 0 base_picker  
�� 
pare
x �������
z
{��
�� .aevtoappnull  �   � ****��  ��  
z  
{ ��
�� .aevtoappnull  �   � ****�� 	)jd*  
y �������
|
}���� 0 is_match  �� ��
~�� 
~  ���� 0 an_item  ��  
| ���� 0 an_item  
} �����
�� 
pcls
�� 
appf�� � ��,� U�� *b   k+  N OL OL �� ��K S�	� �������

����� 0 picker_for_folder  �� ��
��� 
�  ���� 
0 caller  ��  
 ������ 
0 caller  �� 0 folderpicker FolderPicker
� ���
��� 0 folderpicker FolderPicker
� ��
�����
�
���
�� .ascrinit****      � ****
� k     
�
� �
�
� �
�
� �
�
� ,
�
� <����  ��  ��  
� ����������
�� 
pare
�� .aevtoappnull  �   � ****�� 0 finder_selection  �� 0 match_class  �� 0 is_match  
� ����
�
�
�
��� 0 base_picker  
�� 
pare
� �������
�
���
�� .aevtoappnull  �   � ****��  ��  
�  
� ��
�� .aevtoappnull  �   � ****�� 	)jd*  
� �������
�
����� 0 finder_selection  ��  ��  
� ���� 
0 a_list  
� 	������������������ 0 finder_selection  �� 0 	_delegate  �� 0 use_insertion_location  
�� 
bool
�� 
pins�� 0 _is_insertion_location  
�� 
leng�� 0 remove_special  �� L)jd*  E�O)�,j+ 	 �jv �& � 	*�,kvE�UOe)�,FY hO��,k  *�k+ E�Y hO�
� ��/����
�
����� 0 match_class  �� ��
��� 
�  ���� 0 an_item  ��  
� ���� 0 an_item  
� 9���
�� 
pcls
� 
cfol�� � ��,� U
� �~>�}�|
�
��{�~ 0 is_match  �} �z
��z 
�  �y�y 0 an_item  �|  
� �x�x 0 an_item  
� �w�v�u�t�w 0 match_class  �v 0 	_delegate  �u 0 match_suffix  
�t 
bool�{ *�k+  	 )�,�k+ �&�� *b   k+  N OL OL OL OL �� ��K S�	� �sR�r�q
�
��p�s 0 picker_for_disk  �r �o
��o 
�  �n�n 
0 caller  �q  
� �m�l�m 
0 caller  �l 0 
diskpicker 
DiskPicker
� �kU
��k 0 
diskpicker 
DiskPicker
� �j
��i�h
�
��g
�j .ascrinit****      � ****
� k     
�
� W
�
� ^
�
� f�f�f  �i  �h  
� �e�d�c
�e 
pare
�d .aevtoappnull  �   � ****�c 0 match_class  
� �b�a
�
��b 0 picker_for_folder  
�a 
pare
� �`a�_�^
�
��]
�` .aevtoappnull  �   � ****�_  �^  
�  
� �\
�\ .aevtoappnull  �   � ****�] 	)jd*  
� �[i�Z�Y
�
��X�[ 0 match_class  �Z �W
��W 
�  �V�V 0 an_item  �Y  
� �U�U 0 an_item  
� s�T�S
�T 
pcls
�S 
cdis�X � ��,� U�g *b   k+  N OL OL �p ��K S�	� �Rz�Q�P
�
��O�R 0 picker_for_container  �Q �N
��N 
�  �M�M 
0 caller  �P  
� �L�K�L 
0 caller  �K "0 containerpicker ContainerPicker
� �J}
��J "0 containerpicker ContainerPicker
� �I
��H�G
�
��F
�I .ascrinit****      � ****
� k     
�
� 
�
� �
�
� ��E�E  �H  �G  
� �D�C�B
�D 
pare
�C .aevtoappnull  �   � ****�B 0 match_class  
� �A�@
�
��A 0 picker_for_folder  
�@ 
pare
� �?��>�=
�
��<
�? .aevtoappnull  �   � ****�>  �=  
�  
� �;
�; .aevtoappnull  �   � ****�< 	)jd*  
� �:��9�8
�
��7�: 0 match_class  �9 �6
��6 
�  �5�5 0 an_item  �8  
� �4�4 0 an_item  
� ��3�2�1
�3 
cfol
�2 
cdis
�1 
pcls�7 � ��lv��,U�F *b   k+  N OL OL �O ��K S�	� �0��/�.
�
��-�0 0 picker_for_document  �/ �,
��, 
�  �+�+ 
0 caller  �.  
� �*�)�* 
0 caller  �)  0 documentpicker DocumentPicker
� �(�
��(  0 documentpicker DocumentPicker
� �'
��&�%
�
��$
�' .ascrinit****      � ****
� k     
�
� �
�
� �
�
� ��#�#  �&  �%  
� �"�!� 
�" 
pare
�! .aevtoappnull  �   � ****�  0 match_class  
� ��
�
�� 0 picker_for_item  
� 
pare
� ����
�
��
� .aevtoappnull  �   � ****�  �  
�  
� �
� .aevtoappnull  �   � ****� 	)jd*  
� ����
�
��� 0 match_class  � �
�� 
�  �� 0 an_item  �  
� �� 0 an_item  
� ���
� 
pcls
� 
docf� � ��,� U�$ *b   k+  N OL OL �- ��K S�	� ����
�
��� 0 picker_for_package  � �
�� 
�  �
�
 
0 caller  �  
� �	��	 
0 caller  � 0 packagepicker PackagePicker
� ��
�� 0 packagepicker PackagePicker
� �
���
�
��
� .ascrinit****      � ****
� k     
�
� �
�
� ���  �  �  
� �� 
� 
pare�  0 is_match  
� ����
��� 0 picker_for_item  
�� 
pare
� �������
�
����� 0 is_match  �� ��
��� 
�  ���� 0 an_item  ��  
� ���� 0 an_item  
� ���������� 0 is_match  
�� 
alis
�� .sysonfo4asfe        file
�� 
ispk�� )�kd*J   ��&j �,EY h� *b   k+  N OL � ��K S�	� ��<
�
��� 0 
itempicker 
ItemPicker
� ��  
��� 0 
basepicker 
BasePicker
� 

�
  ��






�  
	  
�
�� boovfals
� 
�
Y��
`
a
b
c
�  
T  	���  	� ������
�
���
�� .corecrel****      � null��  ��  
� ������ 0 a_parent  �� "0 finderselection FinderSelection
� ��
��� "0 finderselection FinderSelection
� ��
�����
�
���
�� .ascrinit****      � ****
� k     D
�
� 
�
� 
�
� 
�
� 
�
� 
�
� "
�
� '
�
� ,
�
� 1
�
� 6
�
� ;
�
� @����  ��  ��  
� ������������������������
�� 
pare�� 0 _picker  �� 0 _chooser  �� 0 	_typelist 	_typeList�� 0 _suffixlist _suffixList�� $0 _defaultlocation _defaultLocation��  0 _promptmessage _promptMessage�� &0 _withresolvealias _withResolveAlias�� (0 _targetapplication _targetApplication�� .0 _useinsertionlocation _useInsertionLocation�� 0 _usechooser _useChooser�� 0 _allow_myself  
� ��������������������������
�� 
pare
�� 
msng�� 0 _picker  �� 0 _chooser  �� 0 	_typelist 	_typeList�� 0 _suffixlist _suffixList�� $0 _defaultlocation _defaultLocation��  0 _promptmessage _promptMessage�� &0 _withresolvealias _withResolveAlias�� (0 _targetapplication _targetApplication�� .0 _useinsertionlocation _useInsertionLocation�� 0 _usechooser _useChooser�� 0 _allow_myself  �� Eb   N  O�O�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E��� )E�O��K S�O�	� ��R����
�
����� 0 make_for_item  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_item  �� *j  E�O�j+ 	� ��f����
�
����� 0 make_for_file  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_file  �� *j  E�O�j+ 	� ��z����
�
����� 0 make_for_document  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_document  �� *j  E�O�j+ 	� �������
�
����� 0 make_for_application  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_application  �� *j  E�O�j+ 	� �������
�
����� 0 make_for_package  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_package  �� *j  E�O�j+ 	� �������
�
����� 0 make_for_container  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_container  �� *j  E�O�j+ 	� �������
�
����� 0 make_for_folder  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_folder  �� *j  E�O�j+ 	� �������
�
����� 0 make_for_disk  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_disk  �� *j  E�O�j+ 	� ������� ���� 0 get_selection  ��  ��    �������� 
0 a_list  �� 0 an_item  �� 0 n_select   
���������������������� 0 _picker  
�� .aevtoappnull  �   � ****
�� 
leng�� 0 _usechooser _useChooser�� 0 _chooser  
�� 
msng�� 0 _allow_myself  
�� 
bool
�� 
cobj�� 0 except_myself  �� Q)�,j E�O��,E�O�j  )�,E )�,j E�Y �E�Y  )�,	 �k �& *��k/k+ 	E�Y hO�	� ��B��~�}�� 0 is_insertion_location  �  �~     �|�{�| 0 _picker  �{ 0 is_insertion_location  �} 	)�,j+ 	� �zY�y�x�w�z 0 	set_types  �y �v�v   �u�u 0 	type_list  �x   �t�t 0 	type_list   �s�r�q�s 0 	_typelist 	_typeList�r 0 _suffixlist _suffixList
�q 
msng�w �)�,FO)�,�  jv)�,FY hO)	� �p{�o�n�m�p 0 set_extensions  �o �l	�l 	  �k�k 0 extension_list  �n   �j�j 0 extension_list   �i�h�g�i 0 _suffixlist _suffixList�h 0 	_typelist 	_typeList
�g 
msng�m �)�,FO)�,�  jv)�,FY hO)	� �f��e�d
�c�f 0 set_prompt_message  �e �b�b   �a�a 0 	a_message  �d  
 �`�` 0 	a_message   �_�_  0 _promptmessage _promptMessage�c 	�)�,FO)	� �^��]�\�[�^ 0 set_use_chooser  �] �Z�Z   �Y�Y 
0 a_bool  �\   �X�X 
0 a_bool   �W�W 0 _usechooser _useChooser�[ 	�)�,FO)	� �V��U�T�S�V 0 set_use_insertion_location  �U �R�R   �Q�Q 
0 a_bool  �T   �P�P 
0 a_bool   �O�O .0 _useinsertionlocation _useInsertionLocation�S 	�)�,FO)	� �N��M�L�K�N 0 use_insertion_location  �M  �L     �J�J .0 _useinsertionlocation _useInsertionLocation�K )�,E	� �I��H�G�F�I 0 set_allow_myself  �H �E�E   �D�D 
0 a_bool  �G   �C�C 
0 a_bool   �B�B 0 _allow_myself  �F 	�)�,FO)	� �A��@�?�>�A 0 allow_myself  �@  �?     �=�= 0 _allow_myself  �> )�,E	� �<�;�:�9�< 0 set_resolve_alias  �; �8�8   �7�7 
0 a_bool  �:   �6�6 
0 a_bool   �5�5 &0 _withresolvealias _withResolveAlias�9 	�)�,FO)	� �4�3�2�1�4 0 set_default_location  �3 �0�0   �/�/ 0 
a_location  �2   �.�. 0 
a_location   �-�,
�- 
alis�, $0 _defaultlocation _defaultLocation�1 ��&)�,FO)	� �+5�*�) !�(�+ 0 set_chooser  �* �'"�' "  �&�& 0 a_script  �)    �%�% 0 a_script  ! �$�$ 0 _chooser  �( 	�)�,FO)	� �#F�"�!#$� �# 0 set_chooser_for_folder  �"  �!  #  $ ��� 0 chooser_for_folder  � 0 _chooser  �  *)k+  )�,FO)	� �W��%&�� 0 set_chooser_for_file  �  �  %  & ��� 0 chooser_for_file  � 0 _chooser  � *)k+  )�,FO)	� �h��'(�� 0 current_picker  � �)� )  �� 0 a_script  �  ' �� 0 a_script  ( �� 0 _picker  � )�,E	� �s��*+�� 0 
set_picker  � �,� ,  �
�
 0 a_script  �  * �	�	 0 a_script  + �� 0 _picker  � �)�,F	� ����-.�� 0 setup_for_item  �  �  -  . ���� � 0 picker_for_item  � 0 _picker  � 0 chooser_for_file  �  0 _chooser  � *)k+  )�,FO*)k+ )�,FO)	� �������/0���� 0 setup_for_file  ��  ��  /  0 ���������� 0 picker_for_file  �� 0 _picker  �� 0 chooser_for_file  �� 0 _chooser  �� *)k+  )�,FO*)k+ )�,FO)	� �������12���� 0 setup_for_document  ��  ��  1  2 ���������� 0 picker_for_document  �� 0 _picker  �� 0 chooser_for_file  �� 0 _chooser  �� *)k+  )�,FO*)k+ )�,FO)	� �������34���� 0 setup_for_application  ��  ��  3  4 ���������� 0 picker_for_application  �� 0 _picker  �� 0 chooser_for_file  �� 0 _chooser  �� *)k+  )�,FO*)k+ )�,FO)	� ������56���� 0 setup_for_package  ��  ��  5  6 ���������� 0 picker_for_package  �� 0 _picker  �� 0 chooser_for_file  �� 0 _chooser  �� *)k+  )�,FO*)k+ )�,FO)	� ��%����78���� 0 setup_for_container  ��  ��  7  8 ���������� 0 picker_for_container  �� 0 _picker  �� 0 chooser_for_folder  �� 0 _chooser  �� *)k+  )�,FO*)k+ )�,FO)	� ��C����9:���� 0 setup_for_folder  ��  ��  9  : ���������� 0 picker_for_folder  �� 0 _picker  �� 0 chooser_for_folder  �� 0 _chooser  �� *)k+  )�,FO*)k+ )�,FO)	� ��a����;<���� 0 setup_for_disk  ��  ��  ;  < 	������������������� 0 picker_for_disk  �� 0 _picker  �� 0 chooser_for_folder  �� 0 _chooser  �� $0 _defaultlocation _defaultLocation
�� 
msng
�� 
psxf�� 0 set_default_location  �� /*)k+  )�,FO*)k+ )�,FO)�,�  **��/k+ Y hO)	� �������=>���� 0 is_same_to_me  �� ��?�� ?  ���� 0 an_item  ��  = ������ 0 an_item  �� 0 my_self  > ����������
�� .earsffdralis        afdr��  ��  
�� misccura�� 0 
canon_path  �� ) )j  E�W X  �j  E�O*�k+ *�k+  	� �������@A���� 0 
match_type  �� ��B�� B  ���� 0 an_item  ��  @ ������ 0 an_item  �� 0 fileinfo  A 	������������������
�� 
msng�� 0 	_typelist 	_typeList
�� 
alis
�� 
ptsz
�� .sysonfo4asfe        file
�� 
utid��  ��  
�� 
asty�� h�)�, eY hO)�,jv  fY hO��&�fl E�O )�,��, eY hW X  hO )�,��, eY hW X  hOf	� ��	����CD���� 0 match_suffix  �� ��E�� E  ���� 0 an_item  ��  C ���������� 0 an_item  �� 0 a_result  �� 
0 a_path  �� 0 a_suffix  D 	������6������������ 0 _suffixlist _suffixList
�� 
msng
�� 
utxt
�� 
ctxt����
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� k)�,�  eY hO)�,jv  fY hOfE�O��&E�O�� �[�\[Zk\Z�2E�Y hO %)�,[��l kh �� 
eE�OY h[OY��O�	� ��Y����FG���� 0 resolve_alias  �� ��H�� H  ���� 0 an_item  ��  F ���� 0 an_item  G r���������������� &0 _withresolvealias _withResolveAlias
�� 
pcls
�� 
alia
�� 
bool
�� 
orig��  ��  �� /� ()�,E	 	��,� �&  
��,E�W X  hY hUO�	� ������IJ���� 0 
canon_path  �� ��K�� K  ���� 0 an_item  ��  I ��~� 0 an_item  �~ 
0 a_path  J �}���|�{�z
�} 
psxp
�| 
bool
�{ 
ctxt�z���� )��,E�O��	 ���& �[�\[Zk\Z�2E�Y hO�	� �y��x�wLM�v�y 0 is_same_path  �x �uN�u N  �t�s�t 	0 item1  �s 	0 item2  �w  L �r�q�r 	0 item1  �q 	0 item2  M �p�p 0 
canon_path  �v *�k+  *�k+   	� �o��n�mOP�l�o 0 except_myself  �n �kQ�k Q  �j�j 0 an_item  �m  O �i�i 0 an_item  P �h�g�f�e�d�h 0 is_same_to_me  �g 0 _usechooser _useChooser�f 0 _chooser  
�e .aevtoappnull  �   � ****
�d 
msng�l %*�k+   )�,E )�,j Y �Y �kv	� �c��b�aRS�`�c 	0 debug  �b  �a  R �_�^�_ 0 item_picker  �^ 
0 a_list  S �]�\	 �[�Z�Y�] 0 make_for_item  �\ 0 set_chooser_for_folder  �[ 0 set_prompt_message  �Z 0 set_use_insertion_location  �Y 0 get_selection  �` ,*j+  E�O� *j+ O*�k+ O*ek+ O*j+ E�UO�	� �X	�W�VTU�U�X 0 debug_folder  �W  �V  T  U �T	>�S�R�Q	L�P�T 0 make_for_item  �S .0 _useinsertionlocation _useInsertionLocation
�R .ascrcmnt****      � ****�Q 0 set_use_insertion_location  �P 0 get_selection  �U **j+   "�*�,%j O*ek+ O�*�,%j O*j+ U	� �O	W�N�MVW�L�O 0 debug_document  �N  �M  V  W �K	_�J�I�H�K 0 make_for_document  �J 0 set_prompt_message  �I 0 get_selection  
�H .ascrcmnt****      � ****�L *j+   *�k+ O*j+ j U	� �G	m�F�EXY�D�G 0 open_helpbook  �F  �E  X �C�B�C 0 msg  �B 	0 errno  Y 	�A	w�@�?�>Z�=�<�;
�A 
scpt
�@ .earsffdralis        afdr�? 0 do  �> 0 msg  Z �:�9�8
�: 
errn�9 	0 errno  �8  
�= .miscactvnull��� ��� null
�< 
ret 
�; .sysodisAaleR        TEXT�D - )��/ *)j k+ UW X  *j O��%�%j 	� �7	��6�5[\�4
�7 .aevtoappnull  �   � ****�6  �5  [  \ �3�3 0 open_helpbook  �4 *j+   ascr  ��ޭ