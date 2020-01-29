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
�� .aevtoappnull  �   � ****��  ��  � k     c�� ��� l     ������  � # log "start run in BasePicker"   � ��� : l o g   " s t a r t   r u n   i n   B a s e P i c k e r "� ��� r     ��� n    ��� I    ������� 0 	make_with  � ���� I    
�������� 0 finder_selection  ��  ��  ��  ��  � o     ���� 0 xlist XList� o      ���� 0 selected_list  � ��� r    ��� J    ����  � o      ���� 
0 a_list  � ��� V    `��� k     [�� ��� r     0��� n    .��� I   % .������� 0 resolve_alias  � ���� n  % *��� I   & *�������� 0 next  ��  ��  � o   % &���� 0 selected_list  ��  ��  � o     %���� 0 	_delegate  � o      ���� 0 an_item  � ���� Z   1 [������� I   1 7������� 0 is_match  � ���� o   2 3���� 0 an_item  ��  ��  � k   : W�� ��� Z   : R������ n  : B��� o   ? A���� &0 _withresolvealias _withResolveAlias� o   : ?���� 0 	_delegate  � k   E J�� ��� l  E E������  � G A if an_item is symbolic link, "as alias" cause resolving original   � ��� �   i f   a n _ i t e m   i s   s y m b o l i c   l i n k ,   " a s   a l i a s "   c a u s e   r e s o l v i n g   o r i g i n a l� ���� r   E J��� c   E H��� o   E F���� 0 an_item  � m   F G��
�� 
alis� o      ���� 0 an_item  ��  ��  � r   M R��� c   M P��� o   M N���� 0 an_item  � m   N O��
�� 
utxt� o      ���� 0 an_item  � ���� r   S W��� o   S T���� 0 an_item  � n      ���  ;   U V� o   T U���� 
0 a_list  ��  ��  ��  ��  � l   ������ n   ��� I    �������� 0 has_next  ��  ��  � o    ���� 0 selected_list  ��  ��  � ��� l  a a��������  ��  ��  � ���� L   a c�� o   a b���� 
0 a_list  ��  ��   � ��� l     ��������  ��  ��  � ��� i   Y \��� I      ������� 0 picker_for_file  � ���� o      ���� 
0 caller  ��  ��  � h     ����� 0 
filepicker 
FilePicker� k      �� ��� j     ���
�� 
pare� I     
������� 0 base_picker  � ���� o    ���� 
0 caller  ��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I     ������
�� .aevtoappnull  �   � ****��  ��  � L     �� M     �� I     ������
�� .aevtoappnull  �   � ****��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 match_class  � ���� o      ���� 
0 a_path  ��  ��  � L     �� H     �� D     ��� o     ���� 
0 a_path  � m    �� ���  :�    l     ��������  ��  ��    i     I      ������ 0 is_match   �� o      ���� 0 an_item  ��  ��   k     4 	
	 r      m     ��
�� boovfals o      ���� 0 a_result  
  r    	 c     o    ���� 0 an_item   m    ��
�� 
utxt o      ���� 
0 a_path    Z   
 1���� I   
 ������ 0 match_class   �� o    ���� 
0 a_path  ��  ��   O    - r    , l   *���� G    * I    �� ���� 0 match_suffix    !��! o    ���� 
0 a_path  ��  ��   I   " (��"���� 0 
match_type  " #��# o   # $���� 0 an_item  ��  ��  ��  ��   o      ���� 0 a_result   n   $%$ o    ���� 0 	_delegate  %  f    ��  ��   &��& L   2 4'' o   2 3���� 0 a_result  ��   (��( l     ��~�}�  �~  �}  ��  � )*) l     �|�{�z�|  �{  �z  * +,+ i   ] `-.- I      �y/�x�y 0 picker_for_item  / 0�w0 o      �v�v 
0 caller  �w  �x  . h     �u1�u 0 
itempicker 
ItemPicker1 k      22 343 j     �t5
�t 
pare5 I     
�s6�r�s 0 base_picker  6 7�q7 o    �p�p 
0 caller  �q  �r  4 898 l     �o�n�m�o  �n  �m  9 :;: i    <=< I     �l�k�j
�l .aevtoappnull  �   � ****�k  �j  = L     >> M     ?? I     �i�h�g
�i .aevtoappnull  �   � ****�h  �g  ; @A@ l     �f�e�d�f  �e  �d  A BCB i    DED I      �c�b�a�c 0 finder_selection  �b  �a  E k     KFF GHG l     �`IJ�`  I 0 *log "start finder_selection of ItemPicker"   J �KK T l o g   " s t a r t   f i n d e r _ s e l e c t i o n   o f   I t e m P i c k e r "H LML r     	NON M     PP I      �_�^�]�_ 0 finder_selection  �^  �]  O o      �\�\ 
0 a_list  M QRQ Z   
 3ST�[�ZS F   
 UVU n  
 WXW n   YZY I    �Y�X�W�Y 0 use_insertion_location  �X  �W  Z o    �V�V 0 	_delegate  X  f   
 V l   [�U�T[ =   \]\ o    �S�S 
0 a_list  ] J    �R�R  �U  �T  T k    /^^ _`_ O    )aba r   ! (cdc J   ! &ee f�Qf 1   ! $�P
�P 
pins�Q  d o      �O�O 
0 a_list  b m    gg�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ` h�Nh r   * /iji m   * +�M
�M boovtruej n     klk o   , .�L�L 0 _is_insertion_location  l  f   + ,�N  �[  �Z  R mnm Z   4 Hop�K�Jo =  4 9qrq n   4 7sts 1   5 7�I
�I 
lengt o   4 5�H�H 
0 a_list  r m   7 8�G�G p r   < Duvu I   < B�Fw�E�F 0 remove_special  w x�Dx o   = >�C�C 
0 a_list  �D  �E  v o      �B�B 
0 a_list  �K  �J  n yzy l  I I�A{|�A  { . (log "end finder_selection of ItemPicker"   | �}} P l o g   " e n d   f i n d e r _ s e l e c t i o n   o f   I t e m P i c k e r "z ~�@~ L   I K o   I J�?�? 
0 a_list  �@  C ��� l     �>�=�<�>  �=  �<  � ��� i    ��� I      �;��:�; 0 match_class  � ��9� o      �8�8 0 an_item  �9  �:  � L     �� m     �7
�7 boovtrue� ��� l     �6�5�4�6  �5  �4  � ��� i    ��� I      �3��2�3 0 is_match  � ��1� o      �0�0 0 an_item  �1  �2  � k     *�� ��� Z    ���/�.� H     �� I     �-��,�- 0 match_class  � ��+� o    �*�* 0 an_item  �+  �,  � L   
 �� m   
 �)
�) boovfals�/  �.  � ��� l   �(�'�&�(  �'  �&  � ��%� O    *��� L    )�� l   (��$�#� G    (��� I    �"��!�" 0 match_suffix  � �� � o    �� 0 an_item  �   �!  � I     &���� 0 
match_type  � ��� o   ! "�� 0 an_item  �  �  �$  �#  � n   ��� o    �� 0 	_delegate  �  f    �%  � ��� l     ����  �  �  �  , ��� l     ����  �  �  � ��� i   a d��� I      ���� 0 picker_for_application  � ��� o      �� 
0 caller  �  �  � h     ��� &0 applicationpicker ApplicationPicker� k      �� ��� j     ��
� 
pare� I     
���� 0 base_picker  � ��
� o    �	�	 
0 caller  �
  �  � ��� l     ����  �  �  � ��� i    ��� I     ���
� .aevtoappnull  �   � ****�  �  � L     �� M     �� I     ��� 
� .aevtoappnull  �   � ****�  �   � ��� l     ��������  ��  ��  � ���� i    ��� I      ������� 0 is_match  � ���� o      ���� 0 an_item  ��  ��  � O     ��� L    
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
 3������� F   
 ��� n  
 ��� n   ��� I    �������� 0 use_insertion_location  ��  ��  � o    ���� 0 	_delegate  �  f   
 � l   ������ =   ��� o    ���� 
0 a_list  � J    ����  ��  ��  � k    /    O    ) r   ! ( J   ! & �� 1   ! $��
�� 
pins��   o      ���� 
0 a_list   m    		�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   
��
 r   * / m   * +��
�� boovtrue n      o   , .���� 0 _is_insertion_location    f   + ,��  ��  ��  �  l  4 4��������  ��  ��    Z   4 H���� =  4 9 n   4 7 1   5 7��
�� 
leng o   4 5���� 
0 a_list   m   7 8����  r   < D I   < B������ 0 remove_special   �� o   = >���� 
0 a_list  ��  ��   o      ���� 
0 a_list  ��  ��   �� L   I K o   I J���� 
0 a_list  ��  �   l     ��������  ��  ��    !"! i    #$# I      ��%���� 0 match_class  % &��& o      ���� 0 an_item  ��  ��  $ O     '(' L    
)) =   	*+* n    ,-, m    ��
�� 
pcls- o    ���� 0 an_item  + m    ��
�� 
cfol( m     ..�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  " /0/ l     ��������  ��  ��  0 1��1 i    232 I      ��4���� 0 is_match  4 5��5 o      ���� 0 an_item  ��  ��  3 L     66 l    7����7 F     898 I     ��:���� 0 match_class  : ;��; o    ���� 0 an_item  ��  ��  9 n  	 <=< n  
 >?> I    ��@���� 0 match_suffix  @ A��A o    ���� 0 an_item  ��  ��  ? o   
 ���� 0 	_delegate  =  f   	 
��  ��  ��  � BCB l     ��������  ��  ��  C DED i   i lFGF I      ��H���� 0 picker_for_disk  H I��I o      ���� 
0 caller  ��  ��  G h     ��J�� 0 
diskpicker 
DiskPickerJ k      KK LML j     ��N
�� 
pareN I     
��O���� 0 picker_for_folder  O P��P o    ���� 
0 caller  ��  ��  M QRQ l     ��������  ��  ��  R STS i    UVU I     ������
�� .aevtoappnull  �   � ****��  ��  V L     WW M     XX I     ������
�� .aevtoappnull  �   � ****��  ��  T YZY l     ��������  ��  ��  Z [\[ i    ]^] I      �_�~� 0 match_class  _ `�}` o      �|�| 0 an_item  �}  �~  ^ O     aba L    
cc =   	ded n    fgf m    �{
�{ 
pclsg o    �z�z 0 an_item  e m    �y
�y 
cdisb m     hh�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  \ i�xi l     �w�v�u�w  �v  �u  �x  E jkj l     �t�s�r�t  �s  �r  k lml i   m pnon I      �qp�p�q 0 picker_for_container  p q�oq o      �n�n 
0 caller  �o  �p  o h     �mr�m "0 containerpicker ContainerPickerr k      ss tut j     �lv
�l 
parev I     
�kw�j�k 0 picker_for_folder  w x�ix o    �h�h 
0 caller  �i  �j  u yzy l     �g�f�e�g  �f  �e  z {|{ i    }~} I     �d�c�b
�d .aevtoappnull  �   � ****�c  �b  ~ L      M     �� I     �a�`�_
�a .aevtoappnull  �   � ****�`  �_  | ��� l     �^�]�\�^  �]  �\  � ��� i    ��� I      �[��Z�[ 0 match_class  � ��Y� o      �X�X 0 an_item  �Y  �Z  � O     ��� L    �� E   ��� J    �� ��� m    �W
�W 
cfol� ��V� m    �U
�U 
cdis�V  � n    ��� m   	 �T
�T 
pcls� o    	�S�S 0 an_item  � m     ���                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��R� l     �Q�P�O�Q  �P  �O  �R  m ��� l     �N�M�L�N  �M  �L  � ��� i   q t��� I      �K��J�K 0 picker_for_document  � ��I� o      �H�H 
0 caller  �I  �J  � h     �G��G  0 documentpicker DocumentPicker� k      �� ��� j     �F�
�F 
pare� I     
�E��D�E 0 picker_for_item  � ��C� o    �B�B 
0 caller  �C  �D  � ��� l     �A�@�?�A  �@  �?  � ��� i    ��� I     �>�=�<
�> .aevtoappnull  �   � ****�=  �<  � L     �� M     �� I     �;�:�9
�; .aevtoappnull  �   � ****�:  �9  � ��� l     �8�7�6�8  �7  �6  � ��� i    ��� I      �5��4�5 0 match_class  � ��3� o      �2�2 0 an_item  �3  �4  � O     ��� L    
�� l   	��1�0� =   	��� n    ��� m    �/
�/ 
pcls� o    �.�. 0 an_item  � m    �-
�- 
docf�1  �0  � m     ���                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��,� l     �+�*�)�+  �*  �)  �,  � ��� l     �(�'�&�(  �'  �&  � ��� i   u x��� I      �%��$�% 0 picker_for_package  � ��#� o      �"�" 
0 caller  �#  �$  � h     �!��! 0 packagepicker PackagePicker� k      �� ��� j     � �
�  
pare� I     
���� 0 picker_for_item  � ��� o    �� 
0 caller  �  �  � ��� l     ����  �  �  � ��� i    ��� I      ���� 0 is_match  � ��� o      �� 0 an_item  �  �  � Z     ����� M     �� I      ���� 0 is_match  � ��� o    �� 0 an_item  �  �  � L    �� n    ��� 1    �
� 
ispk� l   ���� I   �
��	
�
 .sysonfo4asfe        file� l   ���� c    ��� o    �� 0 an_item  � m    �
� 
alis�  �  �	  �  �  �  �  �  � ��� l     ����  �  �  � ��� j   y ���� 0 _picker  � I   y � ����  0 picker_for_item  � ����  f   z {��  ��  � ��� l     ��������  ��  ��  � ��� l      ������  �  * public handlers *   � ��� & *   p u b l i c   h a n d l e r s   *� ��� l     ��������  ��  ��  � ��� l      ������  � l f!@group Constructors
Generate an instance depending on kind of items you want from Finder's selection
   � ��� � ! @ g r o u p   C o n s t r u c t o r s 
 G e n e r a t e   a n   i n s t a n c e   d e p e n d i n g   o n   k i n d   o f   i t e m s   y o u   w a n t   f r o m   F i n d e r ' s   s e l e c t i o n 
� ��� i   � ���� I     ������
�� .corecrel****      � null��  ��  � k     �� ��� r     ���  f     � o      ���� 0 a_parent  �    h    ���� "0 finderselection FinderSelection k        j     ��
�� 
pare o     ���� 0 a_parent    j   	 ��	�� 0 _picker  	 m   	 
��
�� 
msng 

 j    ���� 0 _chooser   m    ��
�� 
msng  j    ���� 0 	_typelist 	_typeList n    o    ���� 0 	_typelist 	_typeList  f      j    ���� 0 _suffixlist _suffixList n    o    ���� 0 _suffixlist _suffixList  f      j     ���� $0 _defaultlocation _defaultLocation n    o    ���� $0 _defaultlocation _defaultLocation  f      j   ! &����  0 _promptmessage _promptMessage n  ! %  o   " $����  0 _promptmessage _promptMessage   f   ! " !"! j   ' ,��#�� &0 _withresolvealias _withResolveAlias# n  ' +$%$ o   ( *���� &0 _withresolvealias _withResolveAlias%  f   ' (" &'& j   - 2��(�� (0 _targetapplication _targetApplication( n  - 1)*) o   . 0���� (0 _targetapplication _targetApplication*  f   - .' +,+ j   3 8��-�� .0 _useinsertionlocation _useInsertionLocation- n  3 7./. o   4 6���� .0 _useinsertionlocation _useInsertionLocation/  f   3 4, 010 j   9 >��2�� 0 _usechooser _useChooser2 n  9 =343 o   : <���� 0 _usechooser _useChooser4  f   9 :1 5��5 j   ? D��6�� 0 _allow_myself  6 n  ? C787 o   @ B���� 0 _allow_myself  8  f   ? @��   9:9 l   ��������  ��  ��  : ;��; L    << o    ���� "0 finderselection FinderSelection��  � =>= l     ��������  ��  ��  > ?@? l      ��AB��  A � �!@abstruct
Genegate an instance to obtain all of selected files and folders in Finder.
@result script object : a new FinderSlection instance
   B �CC ! @ a b s t r u c t 
 G e n e g a t e   a n   i n s t a n c e   t o   o b t a i n   a l l   o f   s e l e c t e d   f i l e s   a n d   f o l d e r s   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
@ DED i   � �FGF I      �������� 0 make_for_item  ��  ��  G k     HH IJI r     KLK I    ������
�� .corecrel****      � null��  ��  L o      ���� 0 self  J M��M L    NN n   OPO I   	 �������� 0 setup_for_item  ��  ��  P o    	���� 0 self  ��  E QRQ l     ��������  ��  ��  R STS l      ��UV��  U � �!@abstruct
Generate an instance to pick up files from selection in Finder.
@result script object : a new FinderSlection instance
   V �WW ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   f i l e s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
T XYX i   � �Z[Z I      �������� 0 make_for_file  ��  ��  [ k     \\ ]^] r     _`_ I    ������
�� .corecrel****      � null��  ��  ` o      ���� 0 self  ^ a��a L    bb n   cdc I   	 �������� 0 setup_for_file  ��  ��  d o    	���� 0 self  ��  Y efe l     ��������  ��  ��  f ghg l      ��ij��  i � �!@abstruct
Generate an instance to pick up documents from selection in Finder.
@result script object : a new FinderSlection instance
   j �kk
 ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   d o c u m e n t s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
h lml i   � �non I      �������� 0 make_for_document  ��  ��  o k     pp qrq r     sts I    ������
�� .corecrel****      � null��  ��  t o      ���� 0 self  r u��u L    vv n   wxw I   	 �������� 0 setup_for_document  ��  ��  x o    	���� 0 self  ��  m yzy l     ��������  ��  ��  z {|{ l      ��}~��  } � �!@abstruct
Generate an instance to pick up applications from selection in Finder.
@result script object : a new FinderSlection instance
   ~ � ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   a p p l i c a t i o n s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
| ��� i   � ���� I      �������� 0 make_for_application  ��  ��  � k     �� ��� r     ��� I    ������
�� .corecrel****      � null��  ��  � o      ���� 0 self  � ���� L    �� n   ��� I   	 �������� 0 setup_for_application  ��  ��  � o    	���� 0 self  ��  � ��� l     ��������  ��  ��  � ��� l      ������  � � �!@abstruct
Generate an instance to pick up packages from selection in Finder.
@result script object : an instance of FinderSlection
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   p a c k a g e s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �������� 0 make_for_package  ��  ��  � k     �� ��� r     ��� I    ������
�� .corecrel****      � null��  ��  � o      ���� 0 self  � ���� L    �� n   ��� I   	 �������� 0 setup_for_package  ��  ��  � o    	���� 0 self  ��  � ��� l     ��������  ��  ��  � ��� l      ����  � � �!@abstruct
Generate an instance to pick up disks or folders from selection in Finder.
@result script object : a new FinderSlection instance
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   d i s k s   o r   f o l d e r s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
� ��� i   � ���� I      �~�}�|�~ 0 make_for_container  �}  �|  � k     �� ��� r     ��� I    �{�z�y
�{ .corecrel****      � null�z  �y  � o      �x�x 0 self  � ��w� L    �� n   ��� I   	 �v�u�t�v 0 setup_for_container  �u  �t  � o    	�s�s 0 self  �w  � ��� l     �r�q�p�r  �q  �p  � ��� l      �o���o  � � �!@abstruct
Generate an instance to pick up folders from selection in Finder.
@result script object : a new FinderSlection instance
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   f o l d e r s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
� ��� i   � ���� I      �n�m�l�n 0 make_for_folder  �m  �l  � k     �� ��� r     ��� I    �k�j�i
�k .corecrel****      � null�j  �i  � o      �h�h 0 self  � ��g� L    �� n   ��� I   	 �f�e�d�f 0 setup_for_folder  �e  �d  � o    	�c�c 0 self  �g  � ��� l     �b�a�`�b  �a  �`  � ��� l      �_���_  � � �!@abstruct
Generate an instance to pick up disks from selection in Finder.
@result script object : a new FinderSlection instance
   � ��� ! @ a b s t r u c t 
 G e n e r a t e   a n   i n s t a n c e   t o   p i c k   u p   d i s k s   f r o m   s e l e c t i o n   i n   F i n d e r . 
 @ r e s u l t   s c r i p t   o b j e c t   :   a   n e w   F i n d e r S l e c t i o n   i n s t a n c e 
� ��� i   � ���� I      �^�]�\�^ 0 make_for_disk  �]  �\  � k     �� ��� r     ��� I    �[�Z�Y
�[ .corecrel****      � null�Z  �Y  � o      �X�X 0 self  � ��W� L    �� n   ��� I   	 �V�U�T�V 0 setup_for_disk  �U  �T  � o    	�S�S 0 self  �W  � ��� l     �R�Q�P�R  �Q  �P  � ��� l      �O���O  � � �!@group Getting Finder's Selection 

@abstruct Obtain Finder's selection as a list.
@result list of alias : If failed, missing value will be returned.
   � ���. ! @ g r o u p   G e t t i n g   F i n d e r ' s   S e l e c t i o n   
 
 @ a b s t r u c t   O b t a i n   F i n d e r ' s   s e l e c t i o n   a s   a   l i s t . 
 @ r e s u l t   l i s t   o f   a l i a s   :   I f   f a i l e d ,   m i s s i n g   v a l u e   w i l l   b e   r e t u r n e d . 
� ��� i   � ���� I      �N�M�L�N 0 get_selection  �M  �L  � k     P�� ��� l     �K���K  �  log "start get_selection"   � ��� 2 l o g   " s t a r t   g e t _ s e l e c t i o n "� ��� q      �� �J��J 
0 a_list  � �I��I 0 an_item  � �H�G�H 0 n_select  �G  � ��� r     	��� I    �F��E
�F .aevtoappnull  �   � ****� n    ��� o    �D�D 0 _picker  �  f     �E  � o      �C�C 
0 a_list  � ��� l  
 
�B���B  � . ( log "after run picker in get_selection"   � ��� P   l o g   " a f t e r   r u n   p i c k e r   i n   g e t _ s e l e c t i o n "� � � r   
  n   
  1    �A
�A 
leng o   
 �@�@ 
0 a_list   o      �?�? 0 n_select     Z    M	�> =   

 o    �=�= 0 n_select   m    �<�<   Z    ,�; n    o    �:�: 0 _usechooser _useChooser  f     r    & I   $�9�8
�9 .aevtoappnull  �   � **** n     o     �7�7 0 _chooser    f    �8   o      �6�6 
0 a_list  �;   r   ) , m   ) *�5
�5 
msng o      �4�4 
0 a_list  	  F   / ; l  / 3�3�2 H   / 3 n  / 2 o   0 2�1�1 0 _allow_myself    f   / 0�3  �2   l  6 9 �0�/  =  6 9!"! o   6 7�.�. 0 n_select  " m   7 8�-�- �0  �/   #�,# r   > I$%$ I   > G�+&�*�+ 0 except_myself  & '�)' n   ? C()( 4   @ C�(*
�( 
cobj* m   A B�'�' ) o   ? @�&�& 
0 a_list  �)  �*  % o      �%�% 
0 a_list  �,  �>   +�$+ L   N P,, o   N O�#�# 
0 a_list  �$  � -.- l     �"�!� �"  �!  �   . /0/ l      �12�  1 � �!@abstruct
Return whether an item returned by ((<get_selection>)) is Finder's insertion location or not.
@result boolean : true if retuend item by ((<get_selection>)) is Finder's insertion location.
   2 �33� ! @ a b s t r u c t 
 R e t u r n   w h e t h e r   a n   i t e m   r e t u r n e d   b y   ( ( < g e t _ s e l e c t i o n > ) )   i s   F i n d e r ' s   i n s e r t i o n   l o c a t i o n   o r   n o t . 
 @ r e s u l t   b o o l e a n   :   t r u e   i f   r e t u e n d   i t e m   b y   ( ( < g e t _ s e l e c t i o n > ) )   i s   F i n d e r ' s   i n s e r t i o n   l o c a t i o n . 
0 454 i   � �676 I      ���� 0 is_insertion_location  �  �  7 L     88 n    9:9 n   ;<; I    ���� 0 is_insertion_location  �  �  < o    �� 0 _picker  :  f     5 =>= l     ����  �  �  > ?@? l      �AB�  A � �!@group Accessor Methods 

You can customize behaivior of an instance of FinderSlection.
Following three mehods will be frequently used.

* ((<set_types>))
* ((<set_extensions>))
* ((<set_prompt_message>))
   B �CC� ! @ g r o u p   A c c e s s o r   M e t h o d s   
 
 Y o u   c a n   c u s t o m i z e   b e h a i v i o r   o f   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n . 
 F o l l o w i n g   t h r e e   m e h o d s   w i l l   b e   f r e q u e n t l y   u s e d . 
 
 *   ( ( < s e t _ t y p e s > ) ) 
 *   ( ( < s e t _ e x t e n s i o n s > ) ) 
 *   ( ( < s e t _ p r o m p t _ m e s s a g e > ) ) 
@ DED l     ����  �  �  E FGF l      �HI�  H � �!@abstruct set UTIs or file types of items you want.
@param type_list (list) : list of UTI or file type ex) {"com.apple.traditional-mac-plain-text", "TEXT", "PDF "}
@result script object : me
   I �JJ� ! @ a b s t r u c t   s e t   U T I s   o r   f i l e   t y p e s   o f   i t e m s   y o u   w a n t . 
 @ p a r a m   t y p e _ l i s t   ( l i s t )   :   l i s t   o f   U T I   o r   f i l e   t y p e   e x )   { " c o m . a p p l e . t r a d i t i o n a l - m a c - p l a i n - t e x t " ,   " T E X T " ,   " P D F   " } 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
G KLK i   � �MNM I      �O�� 0 	set_types  O P�P o      �� 0 	type_list  �  �  N k     QQ RSR r     TUT o     �� 0 	type_list  U n     VWV o    �
�
 0 	_typelist 	_typeListW  f    S XYX Z    Z[�	�Z =   \]\ n   	^_^ o    	�� 0 _suffixlist _suffixList_  f    ] m   	 
�
� 
msng[ r    `a` J    ��  a n     bcb o    �� 0 _suffixlist _suffixListc  f    �	  �  Y d�d L    ee  f    �  L fgf l     ��� �  �  �   g hih l      ��jk��  j � �!@abstruct Set path extensions of items you want.
@param extenstion_list (list) : a list of path extensions ex) {".rtf", ".pdf"}
@result script object : me
   k �ll8 ! @ a b s t r u c t   S e t   p a t h   e x t e n s i o n s   o f   i t e m s   y o u   w a n t . 
 @ p a r a m   e x t e n s t i o n _ l i s t   ( l i s t )   :   a   l i s t   o f   p a t h   e x t e n s i o n s   e x )   { " . r t f " ,   " . p d f " } 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
i mnm i   � �opo I      ��q���� 0 set_extensions  q r��r o      ���� 0 extension_list  ��  ��  p k     ss tut r     vwv o     ���� 0 extension_list  w n     xyx o    ���� 0 _suffixlist _suffixListy  f    u z{z Z    |}����| =   ~~ n   	��� o    	���� 0 	_typelist 	_typeList�  f     m   	 
��
�� 
msng} r    ��� J    ����  � n     ��� o    ���� 0 	_typelist 	_typeList�  f    ��  ��  { ���� L    ��  f    ��  n ��� l     ��������  ��  ��  � ��� l      ������  � n h!@abstruct Set a message to displayed in open panel.
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
0 a_bool  � n     ��� o    ���� 0 _allow_myself  �  f    � ���� L    ��  f    ��  � ��� l     ��������  ��  ��  � ��� i   � ���� I      �������� 0 allow_myself  ��  ��  � L     �� n    ��� o    ���� 0 _allow_myself  �  f     � ��� l     ��������  ��  ��  � ��� l      ������  � � �!@abstruct
Whether original of alias is searched for or not.
@param a_bool (boolean) : If false is given, alias files don't follow original items. The default value is ture.
@result script object : me
   � ���� ! @ a b s t r u c t 
 W h e t h e r   o r i g i n a l   o f   a l i a s   i s   s e a r c h e d   f o r   o r   n o t . 
 @ p a r a m   a _ b o o l   ( b o o l e a n )   :   I f   f a l s e   i s   g i v e n ,   a l i a s   f i l e s   d o n ' t   f o l l o w   o r i g i n a l   i t e m s .   T h e   d e f a u l t   v a l u e   i s   t u r e . 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
� ��� i   � ���� I      ������� 0 set_resolve_alias  � ���� o      ���� 
0 a_bool  ��  ��  � k     ��    r      o     ���� 
0 a_bool   n      o    ���� &0 _withresolvealias _withResolveAlias  f     �� L      f    ��  � 	 l     ��������  ��  ��  	 

 l      ����   � �!@abstruct
The default location of the open panel which is displayed when no items are selected in Finder.
@param a_location (a reference) : a reference to a folder
@result script object : me
    �� ! @ a b s t r u c t 
 T h e   d e f a u l t   l o c a t i o n   o f   t h e   o p e n   p a n e l   w h i c h   i s   d i s p l a y e d   w h e n   n o   i t e m s   a r e   s e l e c t e d   i n   F i n d e r . 
 @ p a r a m   a _ l o c a t i o n   ( a   r e f e r e n c e )   :   a   r e f e r e n c e   t o   a   f o l d e r 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
  i   � � I      ������ 0 set_default_location   �� o      ���� 0 
a_location  ��  ��   k     
  r      c      o     ���� 0 
a_location   m    ��
�� 
alis n      o    ���� $0 _defaultlocation _defaultLocation  f     �� L    
  f    	��    !  l     ��������  ��  ��  ! "#" l      ��$%��  $]W----
@abstruct Finder�@�őI�����ڂ������ꍇ�Ɏ��s����X�N���v�g��ݒ肵�܂��B
@description �ݒ肵���X�N���v�g�̕Ԃ�l�� get_selection �̕Ԃ�l�ɂȂ�܂��B�f�t�H���g�ł͎����I�Ƀt�@�C��/�t�H���_�I���_�C�A���O���J���X�N���v�g���ݒ肳��܂��B�����̏ꍇ�A�J�X�^���ɗ^����K�v�͂Ȃ��ł��B
@param a_script (script object)
@result script object : me
   % �&&� - - - - 
 @ a b s t r u c t   F i n d e r0 0g�xb��v�0Lq!0DX4T0k[��L0Y0�0�0�0�0�0�0��-[�0W0~0Y0 
 @ d e s c r i p t i o n  �-[�0W0_0�0�0�0�0�0n��0�P$0L   g e t _ s e l e c t i o n  0n��0�P$0k0j0�0~0Y00�0�0�0�0�0g0o��R�v�0k0�0�0�0� /0�0�0�0��xb�0�0�0�0�0�0���0O0�0�0�0�0�0L�-[�0U0�0~0Y0Y0O0nX4T00�0�0�0�0kN0H0�_ŉ�0o0j0D0g0Y0 
 @ p a r a m   a _ s c r i p t   ( s c r i p t   o b j e c t ) 
 @ r e s u l t   s c r i p t   o b j e c t   :   m e 
# '(' i   � �)*) I      ��+���� 0 set_chooser  + ,��, o      ���� 0 a_script  ��  ��  * k     -- ./. r     010 o     ���� 0 a_script  1 n     232 o    ���� 0 _chooser  3  f    / 4��4 L    55  f    ��  ( 676 l     ��������  ��  ��  7 898 i   � �:;: I      �������� 0 set_chooser_for_folder  ��  ��  ; k     << =>= r     
?@? I     ��A���� 0 chooser_for_folder  A B��B  f    ��  ��  @ n     CDC o    	���� 0 _chooser  D  f    > E��E L    FF  f    ��  9 GHG l     ��������  ��  ��  H IJI i   � �KLK I      �������� 0 set_chooser_for_file  ��  ��  L k     MM NON r     
PQP I     ��R���� 0 chooser_for_file  R S��S  f    ��  ��  Q n     TUT o    	���� 0 _chooser  U  f    O V��V L    WW  f    ��  J XYX l     ��~�}�  �~  �}  Y Z[Z i   � �\]\ I      �|^�{�| 0 current_picker  ^ _�z_ o      �y�y 0 a_script  �z  �{  ] L     `` n    aba o    �x�x 0 _picker  b  f     [ cdc l     �w�v�u�w  �v  �u  d efe i   � �ghg I      �ti�s�t 0 
set_picker  i j�rj o      �q�q 0 a_script  �r  �s  h r     klk o     �p�p 0 a_script  l n     mnm o    �o�o 0 _picker  n  f    f opo l     �n�m�l�n  �m  �l  p qrq l     �k�j�i�k  �j  �i  r sts l      �huv�h  u,&!@group Setup Kind Items to Pick Up 

Change settings of kinds of file and folder to find for instance.
Usually these methods are not required, because these methods are called in constructor methods.

These methods are useful to change settings of an instastance after generating an instance.
   v �wwL ! @ g r o u p   S e t u p   K i n d   I t e m s   t o   P i c k   U p   
 
 C h a n g e   s e t t i n g s   o f   k i n d s   o f   f i l e   a n d   f o l d e r   t o   f i n d   f o r   i n s t a n c e . 
 U s u a l l y   t h e s e   m e t h o d s   a r e   n o t   r e q u i r e d ,   b e c a u s e   t h e s e   m e t h o d s   a r e   c a l l e d   i n   c o n s t r u c t o r   m e t h o d s . 
 
 T h e s e   m e t h o d s   a r e   u s e f u l   t o   c h a n g e   s e t t i n g s   o f   a n   i n s t a s t a n c e   a f t e r   g e n e r a t i n g   a n   i n s t a n c e . 
t xyx l     �g�f�e�g  �f  �e  y z{z l     �d�c�b�d  �c  �b  { |}| l      �a~�a  ~ i c!@abstruct Make all files and folders targets.
@result a reference : an instance of FinderSlection
    ��� � ! @ a b s t r u c t   M a k e   a l l   f i l e s   a n d   f o l d e r s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
} ��� i   � ���� I      �`�_�^�` 0 setup_for_item  �_  �^  � k     �� ��� r     
��� I     �]��\�] 0 picker_for_item  � ��[�  f    �[  �\  � n     ��� o    	�Z�Z 0 _picker  �  f    � ��� r    ��� I    �Y��X�Y 0 chooser_for_file  � ��W�  f    �W  �X  � n     ��� o    �V�V 0 _chooser  �  f    � ��U� L    ��  f    �U  � ��� l     �T�S�R�T  �S  �R  � ��� l      �Q���Q  � ^ X!@abstruct Make only files targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   o n l y   f i l e s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �P�O�N�P 0 setup_for_file  �O  �N  � k     �� ��� r     
��� I     �M��L�M 0 picker_for_file  � ��K�  f    �K  �L  � n     ��� o    	�J�J 0 _picker  �  f    � ��� r    ��� I    �I��H�I 0 chooser_for_file  � ��G�  f    �G  �H  � n     ��� o    �F�F 0 _chooser  �  f    � ��E� L    ��  f    �E  � ��� l     �D�C�B�D  �C  �B  � ��� l      �A���A  � g a!@abstruct Make only document files targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   o n l y   d o c u m e n t   f i l e s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �@�?�>�@ 0 setup_for_document  �?  �>  � k     �� ��� r     
��� I     �=��<�= 0 picker_for_document  � ��;�  f    �;  �<  � n     ��� o    	�:�: 0 _picker  �  f    � ��� r    ��� I    �9��8�9 0 chooser_for_file  � ��7�  f    �7  �8  � n     ��� o    �6�6 0 _chooser  �  f    � ��5� L    ��  f    �5  � ��� l     �4�3�2�4  �3  �2  � ��� l      �1���1  � e _!@abstruct Make only applications targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   o n l y   a p p l i c a t i o n s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      �0�/�.�0 0 setup_for_application  �/  �.  � k     �� ��� r     
��� I     �-��,�- 0 picker_for_application  � ��+�  f    �+  �,  � n     ��� o    	�*�* 0 _picker  �  f    � ��� r    ��� I    �)��(�) 0 chooser_for_file  � ��'�  f    �'  �(  � n     ��� o    �&�& 0 _chooser  �  f    � ��%� L    ��  f    �%  � ��� l     �$�#�"�$  �#  �"  � ��� l      �!���!  � a [!@abstruct Make only packages targets.
@result a reference : an instance of FinderSlection
   � ��� � ! @ a b s t r u c t   M a k e   o n l y   p a c k a g e s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
� ��� i   � ���� I      � ���  0 setup_for_package  �  �  � k     �� ��� r     
   I     ��� 0 picker_for_package   �  f    �  �   n      o    	�� 0 _picker    f    �  r    	 I    �
�� 0 chooser_for_file  
 �  f    �  �  	 n      o    �� 0 _chooser    f     � L      f    �  �  l     ����  �  �    l      ��   r l!@abstruct
Make containers (disks and folders) targets.
@result a reference : an instance of FinderSlection
    � � ! @ a b s t r u c t 
 M a k e   c o n t a i n e r s   ( d i s k s   a n d   f o l d e r s )   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
  i   � I      ���� 0 setup_for_container  �  �   k       r     
 I     � �� 0 picker_for_container    !�!  f    �  �   n     "#" o    	�
�
 0 _picker  #  f     $%$ r    &'& I    �	(��	 0 chooser_for_folder  ( )�)  f    �  �  ' n     *+* o    �� 0 _chooser  +  f    % ,�, L    --  f    �   ./. l     ����  �  �  / 010 l      �23�  2 ` Z!@abstruct Make only folders targets.
@result a reference : an instance of FinderSlection
   3 �44 � ! @ a b s t r u c t   M a k e   o n l y   f o l d e r s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
1 565 i  787 I      � �����  0 setup_for_folder  ��  ��  8 k     99 :;: r     
<=< I     ��>���� 0 picker_for_folder  > ?��?  f    ��  ��  = n     @A@ o    	���� 0 _picker  A  f    ; BCB r    DED I    ��F���� 0 chooser_for_folder  F G��G  f    ��  ��  E n     HIH o    ���� 0 _chooser  I  f    C J��J L    KK  f    ��  6 LML l     ��������  ��  ��  M NON l      ��PQ��  P ^ X!@abstruct Make only disks targets.
@result a reference : an instance of FinderSlection
   Q �RR � ! @ a b s t r u c t   M a k e   o n l y   d i s k s   t a r g e t s . 
 @ r e s u l t   a   r e f e r e n c e   :   a n   i n s t a n c e   o f   F i n d e r S l e c t i o n 
O STS i  
UVU I      �������� 0 setup_for_disk  ��  ��  V k     .WW XYX r     
Z[Z I     ��\���� 0 picker_for_disk  \ ]��]  f    ��  ��  [ n     ^_^ o    	���� 0 _picker  _  f    Y `a` r    bcb I    ��d���� 0 chooser_for_folder  d e��e  f    ��  ��  c n     fgf o    ���� 0 _chooser  g  f    a hih Z    +jk����j =   lml n   non o    ���� $0 _defaultlocation _defaultLocationo  f    m m    ��
�� 
msngk I    '��p���� 0 set_default_location  p q��q 4    #��r
�� 
psxfr l  ! "s����s e   ! "tt m   ! "uu �vv  /��  ��  ��  ��  ��  ��  i w��w L   , .xx  f   , -��  T yzy l     ��������  ��  ��  z {|{ l      ��}~��  } � �!@group Utility Handlers@abstruct
Whether the passed item is identical to the result of &quote;path to me&quote; or &quote;path to current application&quote;.
@param an_item (reference) : a reference to file or folder
@result boolean
   ~ �� ! @ g r o u p   U t i l i t y   H a n d l e r s   @ a b s t r u c t 
 W h e t h e r   t h e   p a s s e d   i t e m   i s   i d e n t i c a l   t o   t h e   r e s u l t   o f   & q u o t e ; p a t h   t o   m e & q u o t e ;   o r   & q u o t e ; p a t h   t o   c u r r e n t   a p p l i c a t i o n & q u o t e ; . 
 @ p a r a m   a n _ i t e m   ( r e f e r e n c e )   :   a   r e f e r e n c e   t o   f i l e   o r   f o l d e r 
 @ r e s u l t   b o o l e a n 
| ��� i  ��� I      ������� 0 is_same_to_me  � ���� o      ���� 0 an_item  ��  ��  � k     (�� ��� l     ������  �  log "start is_same_to_me"   � ��� 2 l o g   " s t a r t   i s _ s a m e _ t o _ m e "� ��� Q     ���� r    
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
�� boovfals��  � o      ���� 0 fileinfo  � ��� l  + +��������  ��  ��  � ��� Q   + G����� Z   . >������� l  . 5������ E  . 5��� n  . 1��� o   / 1���� 0 	_typelist 	_typeList�  f   . /� n   1 4��� 1   2 4��
�� 
utid� o   1 2���� 0 fileinfo  ��  ��  � L   8 :�� m   8 9��
�� boovtrue��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ��� Q   H d����� Z   K [������� l  K R������ E  K R��� n  K N��� o   L N���� 0 	_typelist 	_typeList�  f   K L� n   N Q��� 1   O Q�
� 
asty� o   N O�~�~ 0 fileinfo  ��  ��  � L   U W�� m   U V�}
�} boovtrue��  ��  � R      �|�{�z
�| .ascrerr ****      � ****�{  �z  ��  � ��� l  e e�y�x�w�y  �x  �w  � ��v� L   e g�� m   e f�u
�u boovfals�v  � ��� l     �t�s�r�t  �s  �r  � ��� i  ��� I      �q��p�q 0 match_suffix  �  �o  o      �n�n 0 an_item  �o  �p  � l    j k     j  Z     �m�l =    	
	 n     o    �k�k 0 _suffixlist _suffixList  f     
 m    �j
�j 
msng L    
 m    	�i
�i boovtrue�m  �l    l   �h�g�f�h  �g  �f    Z    �e�d =    n    o    �c�c 0 _suffixlist _suffixList  f     J    �b�b   L     m    �a
�a boovfals�e  �d    l   �`�_�^�`  �_  �^    r    " m     �]
�] boovfals o      �\�\ 0 a_result     r   # (!"! c   # &#$# o   # $�[�[ 0 an_item  $ m   $ %�Z
�Z 
utxt" o      �Y�Y 
0 a_path    %&% Z   ) @'(�X�W' D   ) ,)*) o   ) *�V�V 
0 a_path  * m   * +++ �,,  :( r   / <-.- n   / :/0/ 7  0 :�U12
�U 
ctxt1 m   4 6�T�T 2 m   7 9�S�S��0 o   / 0�R�R 
0 a_path  . o      �Q�Q 
0 a_path  �X  �W  & 343 X   A g5�P65 Z   S b78�O�N7 l  S V9�M�L9 D   S V:;: o   S T�K�K 
0 a_path  ; o   T U�J�J 0 a_suffix  �M  �L  8 k   Y ^<< =>= r   Y \?@? m   Y Z�I
�I boovtrue@ o      �H�H 0 a_result  > A�GA  S   ] ^�G  �O  �N  �P 0 a_suffix  6 n  D GBCB o   E G�F�F 0 _suffixlist _suffixListC  f   D E4 DED l  h h�E�D�C�E  �D  �C  E F�BF L   h jGG o   h i�A�A 0 a_result  �B   #  an_path must be unicode text    �HH :   a n _ p a t h   m u s t   b e   u n i c o d e   t e x t� IJI l     �@�?�>�@  �?  �>  J KLK i  MNM I      �=O�<�= 0 resolve_alias  O P�;P o      �:�: 0 an_item  �;  �<  N k     .QQ RSR O     +TUT Z    *VW�9�8V F    XYX n   Z[Z o    �7�7 &0 _withresolvealias _withResolveAlias[  f    Y l   \�6�5\ =   ]^] n    _`_ m    �4
�4 
pcls` o    �3�3 0 an_item  ^ m    �2
�2 
alia�6  �5  W Q    &ab�1a r    cdc n    efe 1    �0
�0 
origf o    �/�/ 0 an_item  d o      �.�. 0 an_item  b R      �-�,�+
�- .ascrerr ****      � ****�,  �+  �1  �9  �8  U m     gg�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  S h�*h L   , .ii o   , -�)�) 0 an_item  �*  L jkj l     �(�'�&�(  �'  �&  k lml l      �%no�%  n  
== othres    o �pp  = =   o t h r e s  m qrq i  sts I      �$u�#�$ 0 
canon_path  u v�"v o      �!�! 0 an_item  �"  �#  t k     (ww xyx l     � z{�   z  log "start canon_path"   { �|| , l o g   " s t a r t   c a n o n _ p a t h "y }~} r     � n     ��� 1    �
� 
psxp� o     �� 0 an_item  � o      �� 
0 a_path  ~ ��� Z    %����� F    ��� l   	���� >   	��� o    �� 
0 a_path  � m    �� ���  /�  �  � l   ���� D    ��� o    �� 
0 a_path  � m    �� ���  /�  �  � r    !��� n    ��� 7   ���
� 
ctxt� m    �� � m    ����� o    �� 
0 a_path  � o      �� 
0 a_path  �  �  � ��� L   & (�� o   & '�� 
0 a_path  �  r ��� l     ����  �  �  � ��� i  "��� I      �
��	�
 0 is_same_path  � ��� o      �� 	0 item1  � ��� o      �� 	0 item2  �  �	  � L     �� l    ���� =    ��� I     ���� 0 
canon_path  � ��� o    � �  	0 item1  �  �  � I    ������� 0 
canon_path  � ���� o    ���� 	0 item2  ��  ��  �  �  � ��� l     ��������  ��  ��  � ��� i  #&��� I      ������� 0 except_myself  � ���� o      ���� 0 an_item  ��  ��  � k     $�� ��� l     ������  �  log "start except_myself"   � ��� 2 l o g   " s t a r t   e x c e p t _ m y s e l f "� ���� Z     $������ I     ������� 0 is_same_to_me  � ���� o    ���� 0 an_item  ��  ��  � Z   	 ������ n  	 ��� o   
 ���� 0 _usechooser _useChooser�  f   	 
� k    �� ��� l   ������  � / )log "before run chooser in except_myself"   � ��� R l o g   " b e f o r e   r u n   c h o o s e r   i n   e x c e p t _ m y s e l f "� ���� L    �� I   �����
�� .aevtoappnull  �   � ****� n   ��� o    ���� 0 _chooser  �  f    ��  ��  ��  � L    �� m    ��
�� 
msng��  � L     $�� J     #�� ���� o     !���� 0 an_item  ��  ��  � ��� l     ��������  ��  ��  � ��� i  '*��� I      �������� 	0 debug  ��  ��  � k     +�� ��� l     ������  � ! boot (module loader) for me   � ��� 6 b o o t   ( m o d u l e   l o a d e r )   f o r   m e� ��� l     ������  � * $set item_picker to make_for_folder()   � ��� H s e t   i t e m _ p i c k e r   t o   m a k e _ f o r _ f o l d e r ( )� ��� r     ��� I     �������� 0 make_for_item  ��  ��  � o      ���� 0 item_picker  � ��� O    (��� k    '�� ��� I    �������� 0 set_chooser_for_folder  ��  ��  � ��� I    ������� 0 set_prompt_message  � ���� m    �� ��� : C h o o s e   a   d i s k   o f   a   d i s k   i m a g e��  ��  � ��� I    ������� 0 set_use_insertion_location  � ���� m    ��
�� boovtrue��  ��  � ���� r     '��� I     %�������� 0 get_selection  ��  ��  � o      ���� 
0 a_list  ��  � o    	���� 0 item_picker  � ��� l  ) )��	 	��  	   
log a_list   	 �		  l o g   a _ l i s t� 	��	 L   ) +		 o   ) *���� 
0 a_list  ��  � 			 l     ��������  ��  ��  	 			 i  +.			
		 I      �������� 0 debug_folder  ��  ��  	
 k     )		 			 l     ��		��  	 ! boot (module loader) for me   	 �		 6 b o o t   ( m o d u l e   l o a d e r )   f o r   m e	 	��	 O     )			 k    (		 			 l   ��		��  	  tell make_for_container()   	 �		 2 t e l l   m a k e _ f o r _ c o n t a i n e r ( )	 			 l   ��		��  	  tell make_for_folder()   	 �		 , t e l l   m a k e _ f o r _ f o l d e r ( )	 		 	 l   ��	!	"��  	! 9 3set_prompt_message("Choose text file or PDF file.")   	" �	#	# f s e t _ p r o m p t _ m e s s a g e ( " C h o o s e   t e x t   f i l e   o r   P D F   f i l e . " )	  	$	%	$ l   ��	&	'��  	& ! set_types({"TEXT", "PDF "})   	' �	(	( 6 s e t _ t y p e s ( { " T E X T " ,   " P D F   " } )	% 	)	*	) l   ��	+	,��  	+ &  set_extensions({"tion", ".pdf"})   	, �	-	- @ s e t _ e x t e n s i o n s ( { " t i o n " ,   " . p d f " } )	* 	.	/	. I   ��	0��
�� .ascrcmnt****      � ****	0 b    	1	2	1 m    		3	3 �	4	4 H b e f o r e   s e t _ u s e _ i n s e r t i o n _ l o c a t i o n   :  	2 l  	 	5����	5 n   	 	6	7	6 o   
 ���� .0 _useinsertionlocation _useInsertionLocation	7  g   	 
��  ��  ��  	/ 	8	9	8 I    ��	:���� 0 set_use_insertion_location  	: 	;��	; m    ��
�� boovtrue��  ��  	9 	<	=	< I   "��	>��
�� .ascrcmnt****      � ****	> b    	?	@	? m    	A	A �	B	B F a f t e r   s e t _ u s e _ i n s e r t i o n _ l o c a t i o n   :  	@ l   	C����	C n    	D	E	D o    ���� .0 _useinsertionlocation _useInsertionLocation	E  g    ��  ��  ��  	= 	F��	F I   # (�������� 0 get_selection  ��  ��  ��  	 I     �������� 0 make_for_item  ��  ��  ��  	 	G	H	G l     ��������  ��  ��  	H 	I	J	I i  /2	K	L	K I      �������� 0 debug_document  ��  ��  	L O     	M	N	M k    	O	O 	P	Q	P I    ��	R���� 0 set_prompt_message  	R 	S��	S m   	 
	T	T �	U	U : C h o o s e   t e x t   f i l e   o r   P D F   f i l e .��  ��  	Q 	V	W	V l   ��	X	Y��  	X  set_resolve_alias(false)   	Y �	Z	Z 0 s e t _ r e s o l v e _ a l i a s ( f a l s e )	W 	[��	[ I   ��	\��
�� .ascrcmnt****      � ****	\ I    �������� 0 get_selection  ��  ��  ��  ��  	N I     �������� 0 make_for_document  ��  ��  	J 	]	^	] l     ��������  ��  ��  	^ 	_	`	_ i  36	a	b	a I      �������� 0 open_helpbook  ��  ��  	b Q     ,	c	d	e	c O   	f	g	f I   
 ��	h���� 0 do  	h 	i��	i I   ��	j��
�� .earsffdralis        afdr	j  f    ��  ��  ��  	g 4    ��	k
�� 
scpt	k m    	l	l �	m	m  O p e n H e l p B o o k	d R      ��	n	o
�� .ascrerr ****      � ****	n o      ���� 0 msg  	o ��	p��
�� 
errn	p o      �� 	0 errno  ��  	e k    ,	q	q 	r	s	r I   "�~�}�|
�~ .miscactvnull��� ��� null�}  �|  	s 	t�{	t I  # ,�z	u�y
�z .sysodisAaleR        TEXT	u l  # (	v�x�w	v b   # (	w	x	w b   # &	y	z	y o   # $�v�v 0 msg  	z o   $ %�u
�u 
ret 	x o   & '�t�t 	0 errno  �x  �w  �y  �{  	` 	{	|	{ l     �s�r�q�s  �r  �q  	| 	}	~	} i  7:		�	 I     �p�o�n
�p .aevtoappnull  �   � ****�o  �n  	� k     	�	� 	�	�	� l     �m	�	��m  	�  return debug()   	� �	�	�  r e t u r n   d e b u g ( )	� 	�	�	� l     �l	�	��l  	�  return debug_folder()   	� �	�	� * r e t u r n   d e b u g _ f o l d e r ( )	� 	�	�	� l     �k	�	��k  	�  return debug_document()   	� �	�	� . r e t u r n   d e b u g _ d o c u m e n t ( )	� 	��j	� I     �i�h�g�i 0 open_helpbook  �h  �g  �j  	~ 	��f	� l     �e�d�c�e  �d  �c  �f       I�b	� 	�	� C�a�`�_�^�]�\�[�Z	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	��b  	� G�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� �������������
�Y 
pnam
�X 
pimr�W 0 xlist XList�V  0 _promptmessage _promptMessage�U 0 	_typelist 	_typeList�T 0 _suffixlist _suffixList�S (0 _targetapplication _targetApplication�R &0 _withresolvealias _withResolveAlias�Q 0 _usechooser _useChooser�P $0 _defaultlocation _defaultLocation�O .0 _useinsertionlocation _useInsertionLocation�N 0 _allow_myself  �M 0 chooser_for_file  �L 0 chooser_for_folder  �K 0 _chooser  �J 0 base_picker  �I 0 picker_for_file  �H 0 picker_for_item  �G 0 picker_for_application  �F 0 picker_for_folder  �E 0 picker_for_disk  �D 0 picker_for_container  �C 0 picker_for_document  �B 0 picker_for_package  �A 0 _picker  
�@ .corecrel****      � null�? 0 make_for_item  �> 0 make_for_file  �= 0 make_for_document  �< 0 make_for_application  �; 0 make_for_package  �: 0 make_for_container  �9 0 make_for_folder  �8 0 make_for_disk  �7 0 get_selection  �6 0 is_insertion_location  �5 0 	set_types  �4 0 set_extensions  �3 0 set_prompt_message  �2 0 set_use_chooser  �1 0 set_use_insertion_location  �0 0 use_insertion_location  �/ 0 set_allow_myself  �. 0 allow_myself  �- 0 set_resolve_alias  �, 0 set_default_location  �+ 0 set_chooser  �* 0 set_chooser_for_folder  �) 0 set_chooser_for_file  �( 0 current_picker  �' 0 
set_picker  �& 0 setup_for_item  �% 0 setup_for_file  �$ 0 setup_for_document  �# 0 setup_for_application  �" 0 setup_for_package  �! 0 setup_for_container  �  0 setup_for_folder  � 0 setup_for_disk  � 0 is_same_to_me  � 0 
match_type  � 0 match_suffix  � 0 resolve_alias  � 0 
canon_path  � 0 is_same_path  � 0 except_myself  � 	0 debug  � 0 debug_folder  � 0 debug_document  � 0 open_helpbook  
� .aevtoappnull  �   � ****	� �	�� 	�  	�	�	�	� � .�
� 
vers�  	� �	��
� 
cobj	� 	�	�   �
� 
osax�  	� �	��
� 
cobj	� 	�	�   �
 7
�
 
scpt�  	� 	�	�   �	 7
�	 
scpt
�a 
msng
�` 
msng
�_ misccura
�^ boovtrue
�] boovtrue
�\ 
msng
�[ boovfals
�Z boovfals	� � g��	�	��� 0 chooser_for_file  � �	�� 	�  �� 
0 caller  �  	� ��� 
0 caller  � 0 filechooser fileChooser	� �  j	��  0 filechooser fileChooser	� ��	�����	�	���
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
list�� `)�,�, Q*j O)�, D*�,E�O��  	jvE�Y hO*�,�  *�*�,��e�f� Y *�*�,��*�,�e�f� UUO�a &�� b   �OL � ��K S�	� �� �����	�	����� 0 chooser_for_folder  �� ��	��� 	�  ���� 
0 caller  ��  	� ������ 
0 caller  �� 0 folderchooser folderChooser	� �� �	��� 0 folderchooser folderChooser	� ��	�����	�	���
�� .ascrinit****      � ****	� k     
	�	�  �	�	� 	���	� i    
	�	�	� I      ������
�� .aevtoappnull  �   � ****��  ��  	� k     @	�	�  �	�	�  �����  ��  ��  ��  	� ������ 0 	_delegate  
�� .aevtoappnull  �   � ****	� ��	��� 0 	_delegate  	� ��	�����	�	���
�� .aevtoappnull  �   � ****��  ��  	�  	� ������������������������ (0 _targetapplication _targetApplication
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
list�� Ab   �, 2*j Ob    #*�,�  *�*�,l Y *�*�,�*�,� UUO��&�� b   �OL �� ��K S�	� �� j  	��� 0 filechooser fileChooser	� 	�	�  	�	�  	�  	�	� �� ����	�	����� 0 base_picker  �� ��
 �� 
   ���� 0 delegate  ��  	� ������ 0 delegate  �� 0 
basepicker 
BasePicker	� ��
�� 0 
basepicker 
BasePicker
 ��
����

��
�� .ascrinit****      � ****
 k     !

 

 

 

 
	
	  



 (

 �

 �����  ��  ��  
 ������������������ 0 	_delegate  �� 0 _is_insertion_location  �� 0 finder_selection  �� 0 is_match  �� 0 
trash_path  �� 0 remove_special  �� 0 is_insertion_location  
�� .aevtoappnull  �   � ****
 ����





�� 0 	_delegate  �� 0 _is_insertion_location  
 ������

���� 0 finder_selection  ��  ��  
  
 ��
�� 
sele�� � *�,EU
 ������

���� 0 is_match  �� ��
�� 
  ���� 0 an_item  ��  
 ���� 0 an_item  
  �� e
 ��#����

���� 0 
trash_path  ��  ��  
  
 ����
�� afdrtrsh
�� .earsffdralis        afdr�� �j 
 ��+����

���� 0 remove_special  �� ��
�� 
  ���� 
0 a_list  ��  
 �������� 
0 a_list  �� 0 
a_location  �� 
0 a_name  
 ��������w������~�}�|
�� 
cobj
�� 
alis��  ��  
�� 
brow
�� .coredoexnull���     obj 
� 
pnam
�~ 
trsh
�} 
dnam�| 0 
trash_path  �� \��k/E�O ��&O�kvE�W DX  jvE�O� 5*�k/j  )*�k/�,E�O�*�,�,  )j+ 
E�O�kvE�Y hY hUO�
 �{��z�y

�x�{ 0 is_insertion_location  �z  �y  
  
 �w�w 0 _is_insertion_location  �x )�,E
 �v��u�t

 �s
�v .aevtoappnull  �   � ****�u  �t  
 �r�q�p�r 0 selected_list  �q 
0 a_list  �p 0 an_item  
  	�o�n�m�l�k�j�i�h�g�o 0 finder_selection  �n 0 	make_with  �m 0 has_next  �l 0 next  �k 0 resolve_alias  �j 0 is_match  �i &0 _withresolvealias _withResolveAlias
�h 
alis
�g 
utxt�s db  *j+  k+ E�OjvE�O Ih�j+ b   �j+ k+ E�O*�k+  "b   �,E 
��&E�Y ��&E�O��6FY h[OY��O��� "b   �Of�OL OL OL OL OL OL �� ��K S�	� �f��e�d
!
"�c�f 0 picker_for_file  �e �b
#�b 
#  �a�a 
0 caller  �d  
! �`�_�` 
0 caller  �_ 0 
filepicker 
FilePicker
" �^�
$�^ 0 
filepicker 
FilePicker
$ �]
%�\�[
&
'�Z
�] .ascrinit****      � ****
% k     
(
( �
)
) �
*
* �
+
+ �Y�Y  �\  �[  
& �X�W�V�U
�X 
pare
�W .aevtoappnull  �   � ****�V 0 match_class  �U 0 is_match  
' �T�S
,
-
.�T 0 base_picker  
�S 
pare
, �R��Q�P
/
0�O
�R .aevtoappnull  �   � ****�Q  �P  
/  
0 �N
�N .aevtoappnull  �   � ****�O 	)jd*  
- �M��L�K
1
2�J�M 0 match_class  �L �I
3�I 
3  �H�H 
0 a_path  �K  
1 �G�G 
0 a_path  
2 ��J ��
. �F�E�D
4
5�C�F 0 is_match  �E �B
6�B 
6  �A�A 0 an_item  �D  
4 �@�?�>�@ 0 an_item  �? 0 a_result  �> 
0 a_path  
5 �=�<�;�:�9�8
�= 
utxt�< 0 match_class  �; 0 	_delegate  �: 0 match_suffix  �9 0 
match_type  
�8 
bool�C 5fE�O��&E�O*�k+  )�, *�k+ 
 
*�k+ �&E�UY hO��Z *b   k+  N OL OL OL �c ��K S�	� �7.�6�5
7
8�4�7 0 picker_for_item  �6 �3
9�3 
9  �2�2 
0 caller  �5  
7 �1�0�1 
0 caller  �0 0 
itempicker 
ItemPicker
8 �/1
:�/ 0 
itempicker 
ItemPicker
: �.
;�-�,
<
=�+
�. .ascrinit****      � ****
; k     
>
> 3
?
? :
@
@ B
A
A �
B
B ��*�*  �-  �,  
< �)�(�'�&�%
�) 
pare
�( .aevtoappnull  �   � ****�' 0 finder_selection  �& 0 match_class  �% 0 is_match  
= �$�#
C
D
E
F�$ 0 base_picker  
�# 
pare
C �"=�!� 
G
H�
�" .aevtoappnull  �   � ****�!  �   
G  
H �
� .aevtoappnull  �   � ****� 	)jd*  
D �E��
I
J�� 0 finder_selection  �  �  
I �� 
0 a_list  
J 	����g����� 0 finder_selection  � 0 	_delegate  � 0 use_insertion_location  
� 
bool
� 
pins� 0 _is_insertion_location  
� 
leng� 0 remove_special  � L)jd*  E�O)�,j+ 	 �jv �& � 	*�,kvE�UOe)�,FY hO��,k  *�k+ E�Y hO�
E ����
K
L�� 0 match_class  � �
M� 
M  �� 0 an_item  �  
K �
�
 0 an_item  
L  � e
F �	���
N
O��	 0 is_match  � �
P� 
P  �� 0 an_item  �  
N �� 0 an_item  
O ��� ����� 0 match_class  � 0 	_delegate  �  0 match_suffix  �� 0 
match_type  
�� 
bool� +*�k+   fY hO)�, *�k+ 
 
*�k+ �&U�+ *b   k+  N OL OL OL OL �4 ��K S�	� �������
Q
R���� 0 picker_for_application  �� ��
S�� 
S  ���� 
0 caller  ��  
Q ������ 
0 caller  �� &0 applicationpicker ApplicationPicker
R ���
T�� &0 applicationpicker ApplicationPicker
T ��
U����
V
W��
�� .ascrinit****      � ****
U k     
X
X �
Y
Y �
Z
Z �����  ��  ��  
V ������
�� 
pare
�� .aevtoappnull  �   � ****�� 0 is_match  
W ����
[
\�� 0 base_picker  
�� 
pare
[ �������
]
^��
�� .aevtoappnull  �   � ****��  ��  
]  
^ ��
�� .aevtoappnull  �   � ****�� 	)jd*  
\ �������
_
`���� 0 is_match  �� ��
a�� 
a  ���� 0 an_item  ��  
_ ���� 0 an_item  
` �����
�� 
pcls
�� 
appf�� � ��,� U�� *b   k+  N OL OL �� ��K S�	� �������
b
c���� 0 picker_for_folder  �� ��
d�� 
d  ���� 
0 caller  ��  
b ������ 
0 caller  �� 0 folderpicker FolderPicker
c ���
e�� 0 folderpicker FolderPicker
e ��
f����
g
h��
�� .ascrinit****      � ****
f k     
i
i �
j
j �
k
k �
l
l !
m
m 1����  ��  ��  
g ����������
�� 
pare
�� .aevtoappnull  �   � ****�� 0 finder_selection  �� 0 match_class  �� 0 is_match  
h ����
n
o
p
q�� 0 base_picker  
�� 
pare
n �������
r
s��
�� .aevtoappnull  �   � ****��  ��  
r  
s ��
�� .aevtoappnull  �   � ****�� 	)jd*  
o �������
t
u���� 0 finder_selection  ��  ��  
t ���� 
0 a_list  
u 	��������	���������� 0 finder_selection  �� 0 	_delegate  �� 0 use_insertion_location  
�� 
bool
�� 
pins�� 0 _is_insertion_location  
�� 
leng�� 0 remove_special  �� L)jd*  E�O)�,j+ 	 �jv �& � 	*�,kvE�UOe)�,FY hO��,k  *�k+ E�Y hO�
p ��$����
v
w���� 0 match_class  �� ��
x�� 
x  ���� 0 an_item  ��  
v ���� 0 an_item  
w .����
�� 
pcls
�� 
cfol�� � ��,� U
q ��3����
y
z���� 0 is_match  �� ��
{�� 
{  ���� 0 an_item  ��  
y ���� 0 an_item  
z ���������� 0 match_class  �� 0 	_delegate  �� 0 match_suffix  
�� 
bool�� *�k+  	 )�,�k+ �&�� *b   k+  N OL OL OL OL �� ��K S�	� ��G����
|
}���� 0 picker_for_disk  �� ��
~�� 
~  ���� 
0 caller  ��  
| ������ 
0 caller  �� 0 
diskpicker 
DiskPicker
} ��J
�� 0 
diskpicker 
DiskPicker
 ��
�����
�
���
�� .ascrinit****      � ****
� k     
�
� L
�
� S
�
� [����  ��  ��  
� ������
�� 
pare
�� .aevtoappnull  �   � ****�� 0 match_class  
� ����
�
��� 0 picker_for_folder  
�� 
pare
� ��V����
�
���
�� .aevtoappnull  �   � ****��  ��  
�  
� ��
�� .aevtoappnull  �   � ****�� 	)jd*  
� ��^����
�
����� 0 match_class  �� ��
��� 
�  ���� 0 an_item  ��  
� ���� 0 an_item  
� h����
�� 
pcls
�� 
cdis�� � ��,� U�� *b   k+  N OL OL �� ��K S�	� ��o��~
�
��}�� 0 picker_for_container  � �|
��| 
�  �{�{ 
0 caller  �~  
� �z�y�z 
0 caller  �y "0 containerpicker ContainerPicker
� �xr
��x "0 containerpicker ContainerPicker
� �w
��v�u
�
��t
�w .ascrinit****      � ****
� k     
�
� t
�
� {
�
� ��s�s  �v  �u  
� �r�q�p
�r 
pare
�q .aevtoappnull  �   � ****�p 0 match_class  
� �o�n
�
��o 0 picker_for_folder  
�n 
pare
� �m~�l�k
�
��j
�m .aevtoappnull  �   � ****�l  �k  
�  
� �i
�i .aevtoappnull  �   � ****�j 	)jd*  
� �h��g�f
�
��e�h 0 match_class  �g �d
��d 
�  �c�c 0 an_item  �f  
� �b�b 0 an_item  
� ��a�`�_
�a 
cfol
�` 
cdis
�_ 
pcls�e � ��lv��,U�t *b   k+  N OL OL �} ��K S�	� �^��]�\
�
��[�^ 0 picker_for_document  �] �Z
��Z 
�  �Y�Y 
0 caller  �\  
� �X�W�X 
0 caller  �W  0 documentpicker DocumentPicker
� �V�
��V  0 documentpicker DocumentPicker
� �U
��T�S
�
��R
�U .ascrinit****      � ****
� k     
�
� �
�
� �
�
� ��Q�Q  �T  �S  
� �P�O�N
�P 
pare
�O .aevtoappnull  �   � ****�N 0 match_class  
� �M�L
�
��M 0 picker_for_item  
�L 
pare
� �K��J�I
�
��H
�K .aevtoappnull  �   � ****�J  �I  
�  
� �G
�G .aevtoappnull  �   � ****�H 	)jd*  
� �F��E�D
�
��C�F 0 match_class  �E �B
��B 
�  �A�A 0 an_item  �D  
� �@�@ 0 an_item  
� ��?�>
�? 
pcls
�> 
docf�C � ��,� U�R *b   k+  N OL OL �[ ��K S�	� �=��<�;
�
��:�= 0 picker_for_package  �< �9
��9 
�  �8�8 
0 caller  �;  
� �7�6�7 
0 caller  �6 0 packagepicker PackagePicker
� �5�
��5 0 packagepicker PackagePicker
� �4
��3�2
�
��1
�4 .ascrinit****      � ****
� k     
�
� �
�
� ��0�0  �3  �2  
� �/�.
�/ 
pare�. 0 is_match  
� �-�,
��- 0 picker_for_item  
�, 
pare
� �+��*�)
�
��(�+ 0 is_match  �* �'
��' 
�  �&�& 0 an_item  �)  
� �%�% 0 an_item  
� �$�#�"�!�$ 0 is_match  
�# 
alis
�" .sysonfo4asfe        file
�! 
ispk�( )�kd*J   ��&j �,EY h�1 *b   k+  N OL �: ��K S�	� � 1
�
��  0 
itempicker 
ItemPicker
� �  
�� 0 
basepicker 
BasePicker
� 

�
  �






�  	�  
�
� boovfals
� 
�
<�
C
D
E
F
�  
7  	��  	� ����
�
��
� .corecrel****      � null�  �  
� ��� 0 a_parent  � "0 finderselection FinderSelection
� �
�� "0 finderselection FinderSelection
� �
���
�
��
� .ascrinit****      � ****
� k     D
�
� 
�
� 
�
� 

�
� 
�
� 
�
� 
�
� 
�
� !
�
� &
�
� +
�
� 0
�
� 5��  �  �  
� �������
�	����
� 
pare� 0 _picker  � 0 _chooser  � 0 	_typelist 	_typeList� 0 _suffixlist _suffixList� $0 _defaultlocation _defaultLocation�
  0 _promptmessage _promptMessage�	 &0 _withresolvealias _withResolveAlias� (0 _targetapplication _targetApplication� .0 _useinsertionlocation _useInsertionLocation� 0 _usechooser _useChooser� 0 _allow_myself  
� ����� ����������������
� 
pare
� 
msng� 0 _picker  � 0 _chooser  �  0 	_typelist 	_typeList�� 0 _suffixlist _suffixList�� $0 _defaultlocation _defaultLocation��  0 _promptmessage _promptMessage�� &0 _withresolvealias _withResolveAlias�� (0 _targetapplication _targetApplication�� .0 _useinsertionlocation _useInsertionLocation�� 0 _usechooser _useChooser�� 0 _allow_myself  � Eb   N  O�O�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�O)�,E�� )E�O��K S�O�	� ��G����
�
����� 0 make_for_item  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_item  �� *j  E�O�j+ 	� ��[����
�
����� 0 make_for_file  ��  ��  
� ���� 0 self  
� ����
�� .corecrel****      � null�� 0 setup_for_file  �� *j  E�O�j+ 	� ��o����
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
�� .corecrel****      � null�� 0 setup_for_disk  �� *j  E�O�j+ 	� �������
�
����� 0 get_selection  ��  ��  
� �������� 
0 a_list  �� 0 an_item  �� 0 n_select  
� 
���������������������� 0 _picker  
�� .aevtoappnull  �   � ****
�� 
leng�� 0 _usechooser _useChooser�� 0 _chooser  
�� 
msng�� 0 _allow_myself  
�� 
bool
�� 
cobj�� 0 except_myself  �� Q)�,j E�O��,E�O�j  )�,E )�,j E�Y �E�Y  )�,	 �k �& *��k/k+ 	E�Y hO�	� ��7����
�
����� 0 is_insertion_location  ��  ��  
�  
� ������ 0 _picker  �� 0 is_insertion_location  �� 	)�,j+ 	� ��N����
�
����� 0 	set_types  �� ��
��� 
�  ���� 0 	type_list  ��  
� ���� 0 	type_list  
� �������� 0 	_typelist 	_typeList�� 0 _suffixlist _suffixList
�� 
msng�� �)�,FO)�,�  jv)�,FY hO)	� ��p����
�
����� 0 set_extensions  �� ��
��� 
�  ���� 0 extension_list  ��  
� ���� 0 extension_list  
� �������� 0 _suffixlist _suffixList�� 0 	_typelist 	_typeList
�� 
msng�� �)�,FO)�,�  jv)�,FY hO)	� �������
�
����� 0 set_prompt_message  �� ��
��� 
�  ���� 0 	a_message  ��  
� ���� 0 	a_message  
� ����  0 _promptmessage _promptMessage�� 	�)�,FO)	� �������
�
����� 0 set_use_chooser  �� ��
��� 
�  ���� 
0 a_bool  ��  
� ���� 
0 a_bool  
� ���� 0 _usechooser _useChooser�� 	�)�,FO)	� �������
�
����� 0 set_use_insertion_location  �� ��
��� 
�  �� 
0 a_bool  ��  
� �~�~ 
0 a_bool  
� �}�} .0 _useinsertionlocation _useInsertionLocation�� 	�)�,FO)	� �|��{�z
�
��y�| 0 use_insertion_location  �{  �z  
�  
� �x�x .0 _useinsertionlocation _useInsertionLocation�y )�,E	� �w��v�u
�
��t�w 0 set_allow_myself  �v �s
��s 
�  �r�r 
0 a_bool  �u  
� �q�q 
0 a_bool  
� �p�p 0 _allow_myself  �t 	�)�,FO)	� �o��n�m
�
��l�o 0 allow_myself  �n  �m  
�  
� �k�k 0 _allow_myself  �l )�,E	� �j��i�h
�
��g�j 0 set_resolve_alias  �i �f
��f 
�  �e�e 
0 a_bool  �h  
� �d�d 
0 a_bool  
� �c�c &0 _withresolvealias _withResolveAlias�g 	�)�,FO)	� �b�a�` �_�b 0 set_default_location  �a �^�^   �]�] 0 
a_location  �`    �\�\ 0 
a_location   �[�Z
�[ 
alis�Z $0 _defaultlocation _defaultLocation�_ ��&)�,FO)	� �Y*�X�W�V�Y 0 set_chooser  �X �U�U   �T�T 0 a_script  �W   �S�S 0 a_script   �R�R 0 _chooser  �V 	�)�,FO)	� �Q;�P�O�N�Q 0 set_chooser_for_folder  �P  �O     �M�L�M 0 chooser_for_folder  �L 0 _chooser  �N *)k+  )�,FO)	� �KL�J�I	�H�K 0 set_chooser_for_file  �J  �I    	 �G�F�G 0 chooser_for_file  �F 0 _chooser  �H *)k+  )�,FO)	� �E]�D�C
�B�E 0 current_picker  �D �A�A   �@�@ 0 a_script  �C  
 �?�? 0 a_script   �>�> 0 _picker  �B )�,E	� �=h�<�;�:�= 0 
set_picker  �< �9�9   �8�8 0 a_script  �;   �7�7 0 a_script   �6�6 0 _picker  �: �)�,F	� �5��4�3�2�5 0 setup_for_item  �4  �3     �1�0�/�.�1 0 picker_for_item  �0 0 _picker  �/ 0 chooser_for_file  �. 0 _chooser  �2 *)k+  )�,FO*)k+ )�,FO)	� �-��,�+�*�- 0 setup_for_file  �,  �+     �)�(�'�&�) 0 picker_for_file  �( 0 _picker  �' 0 chooser_for_file  �& 0 _chooser  �* *)k+  )�,FO*)k+ )�,FO)	� �%��$�#�"�% 0 setup_for_document  �$  �#     �!� ���! 0 picker_for_document  �  0 _picker  � 0 chooser_for_file  � 0 _chooser  �" *)k+  )�,FO*)k+ )�,FO)	� ������ 0 setup_for_application  �  �     ����� 0 picker_for_application  � 0 _picker  � 0 chooser_for_file  � 0 _chooser  � *)k+  )�,FO*)k+ )�,FO)	� ������ 0 setup_for_package  �  �     ����� 0 picker_for_package  � 0 _picker  � 0 chooser_for_file  � 0 _chooser  � *)k+  )�,FO*)k+ )�,FO)	� ����
� 0 setup_for_container  �  �     �	����	 0 picker_for_container  � 0 _picker  � 0 chooser_for_folder  � 0 _chooser  �
 *)k+  )�,FO*)k+ )�,FO)	� �8���� 0 setup_for_folder  �  �     �� ����� 0 picker_for_folder  �  0 _picker  �� 0 chooser_for_folder  �� 0 _chooser  � *)k+  )�,FO*)k+ )�,FO)	� ��V�������� 0 setup_for_disk  ��  ��     	��������������u���� 0 picker_for_disk  �� 0 _picker  �� 0 chooser_for_folder  �� 0 _chooser  �� $0 _defaultlocation _defaultLocation
�� 
msng
�� 
psxf�� 0 set_default_location  �� /*)k+  )�,FO*)k+ )�,FO)�,�  **��/k+ Y hO)	� ������� !���� 0 is_same_to_me  �� ��"�� "  ���� 0 an_item  ��    ������ 0 an_item  �� 0 my_self  ! ����������
�� .earsffdralis        afdr��  ��  
�� misccura�� 0 
canon_path  �� ) )j  E�W X  �j  E�O*�k+ *�k+  	� �������#$���� 0 
match_type  �� ��%�� %  ���� 0 an_item  ��  # ������ 0 an_item  �� 0 fileinfo  $ 	������������������
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
asty�� h�)�, eY hO)�,jv  fY hO��&�fl E�O )�,��, eY hW X  hO )�,��, eY hW X  hOf	� �������&'���� 0 match_suffix  �� ��(�� (  ���� 0 an_item  ��  & ���������� 0 an_item  �� 0 a_result  �� 
0 a_path  �� 0 a_suffix  ' 	������+������������ 0 _suffixlist _suffixList
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
eE�OY h[OY��O�	� ��N����)*���� 0 resolve_alias  �� ��+�� +  ���� 0 an_item  ��  ) ���� 0 an_item  * g���������������� &0 _withresolvealias _withResolveAlias
�� 
pcls
�� 
alia
�� 
bool
�� 
orig��  ��  �� /� ()�,E	 	��,� �&  
��,E�W X  hY hUO�	� ��t����,-���� 0 
canon_path  �� ��.�� .  ���� 0 an_item  ��  , ������ 0 an_item  �� 
0 a_path  - ����������
�� 
psxp
�� 
bool
�� 
ctxt������ )��,E�O��	 ���& �[�\[Zk\Z�2E�Y hO�	� �������/0���� 0 is_same_path  �� ��1�� 1  ������ 	0 item1  �� 	0 item2  ��  / ������ 	0 item1  �� 	0 item2  0 ���� 0 
canon_path  �� *�k+  *�k+   	� �������23���� 0 except_myself  �� ��4�� 4  ���� 0 an_item  ��  2 ���� 0 an_item  3 ������������ 0 is_same_to_me  �� 0 _usechooser _useChooser�� 0 _chooser  
�� .aevtoappnull  �   � ****
�� 
msng�� %*�k+   )�,E )�,j Y �Y �kv	� �������56���� 	0 debug  ��  ��  5 ������ 0 item_picker  �� 
0 a_list  6 ������������� 0 make_for_item  �� 0 set_chooser_for_folder  �� 0 set_prompt_message  �� 0 set_use_insertion_location  �� 0 get_selection  �� ,*j+  E�O� *j+ O*�k+ O*ek+ O*j+ E�UO�	� ��	
����78���� 0 debug_folder  ��  ��  7  8 ��	3�����	A�~�� 0 make_for_item  �� .0 _useinsertionlocation _useInsertionLocation
�� .ascrcmnt****      � ****� 0 set_use_insertion_location  �~ 0 get_selection  �� **j+   "�*�,%j O*ek+ O�*�,%j O*j+ U	� �}	L�|�{9:�z�} 0 debug_document  �|  �{  9  : �y	T�x�w�v�y 0 make_for_document  �x 0 set_prompt_message  �w 0 get_selection  
�v .ascrcmnt****      � ****�z *j+   *�k+ O*j+ j U	� �u	b�t�s;<�r�u 0 open_helpbook  �t  �s  ; �q�p�q 0 msg  �p 	0 errno  < 	�o	l�n�m�l=�k�j�i
�o 
scpt
�n .earsffdralis        afdr�m 0 do  �l 0 msg  = �h�g�f
�h 
errn�g 	0 errno  �f  
�k .miscactvnull��� ��� null
�j 
ret 
�i .sysodisAaleR        TEXT�r - )��/ *)j k+ UW X  *j O��%�%j 	� �e	��d�c>?�b
�e .aevtoappnull  �   � ****�d  �c  >  ? �a�a 0 open_helpbook  �b *j+   ascr  ��ޭ