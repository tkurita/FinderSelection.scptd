property name : "FinderSelection"
(*!@title FinderSelection Reference
* Version : 2.0.8b
* Author : Tetsuro KURITA ((<tkurita@mac.com>))

Finder の選択項目を取得する AppleScript モジュールです。以下のような機能を簡便に行えます。

* Finder の選択物の中から必要なものだけを選び出します。
* 選択物がなかったり条件に該当するものがなかったら、ファイル選択ダイアログを開きます。
* Droplet/Applet が Finder からダブルクリックによって起動されたら、ファイル選択ダイアログ を開きます。
* 選択物中にエイリアスファイルが含まれていたら、オリジナルへの参照を取得してオリジナルが条件に該当するか調べます。エイリアスファイルのオリジナルを求めない動作を設定する事もできます。
 *)

property XList : module

(** Class Variable **)
property _promptMessage : "Choose an item"
property _typeList : missing value
property _suffixList : missing value
property _targetApplication : current application
property _withResolveAlias : true
property _useChooser : true
property _defaultLocation : missing value
property _useInsertionLocation : false
property _allow_myself : false

(** build in chooser script **)
on chooser_for_file(caller)
	script fileChooser
		property _delegate : caller
		tell my _delegate's _targetApplication
			activate
			tell my _delegate
				set type_list to it's _typeList
				if type_list is missing value then
					set type_list to {}
				end if
				if (it's _defaultLocation) is missing value then
					choose file with prompt it's _promptMessage of type type_list with multiple selections allowed without invisibles
				else
					choose file with prompt it's _promptMessage of type type_list default location it's _defaultLocation with multiple selections allowed without invisibles
				end if
			end tell
		end tell
		return (result as list)
	end script
end chooser_for_file

on chooser_for_folder(caller)
	script folderChooser
		property _delegate : caller
		
		tell _delegate's _targetApplication
			activate
			tell _delegate
				if it's _defaultLocation is missing value then
					choose folder with prompt it's _promptMessage
				else
					choose folder with prompt it's _promptMessage default location it's _defaultLocation
				end if
			end tell
		end tell
		return (result as list)
	end script
end chooser_for_folder

property _chooser : chooser_for_file(me) -- obsolute

(** picker scripts **)
on base_picker(delegate)
	script BasePicker
		property _delegate : delegate
		property _is_insertion_location : false
		
		on finder_selection()
			tell application "Finder"
				return selection
			end tell
		end finder_selection
		
		on is_match(an_item)
			return true
		end is_match
		
		on trash_path()
			return path to trash
		end trash_path
		
		on remove_special(a_list)
			--log "start remove special"
			set a_location to item 1 of a_list
			try
				a_location as alias
				set a_list to {a_location}
			on error
				--log "error"
				set a_list to {}
				tell application "Finder"
					if (exists Finder window 1) then
						set a_name to name of Finder window 1
						if a_name is displayed name of trash then
							set a_location to my trash_path()
							set a_list to {a_location}
						end if
					end if
				end tell
			end try
			--log a_list
			--log "end remove_special"
			return a_list
		end remove_special
		
		on is_insertion_location()
			return my _is_insertion_location
		end is_insertion_location
		
		on run
			--log "start run in BasePicker"
			set selected_list to XList's make_with(finder_selection())
			set a_list to {}
			repeat while (selected_list's has_next())
				set an_item to _delegate's resolve_alias(selected_list's next())
				if is_match(an_item) then
					if _delegate's _withResolveAlias then
						-- if an_item is symbolic link, "as alias" cause resolving original
						set an_item to an_item as alias
					else
						set an_item to an_item as Unicode text
					end if
					set end of a_list to an_item
				end if
			end repeat
			
			return a_list
		end run
	end script
end base_picker

on picker_for_file(caller)
	script FilePicker
		property parent : base_picker(caller)
		
		on run
			return continue run
		end run
		
		on match_class(a_path)
			return a_path does not end with ":"
		end match_class
		
		on is_match(an_item)
			set a_result to false
			set a_path to an_item as Unicode text
			if match_class(a_path) then
				tell my _delegate
					set a_result to (match_suffix(a_path) or match_type(an_item))
				end tell
			end if
			return a_result
		end is_match
		
	end script
end picker_for_file

on picker_for_item(caller)
	script ItemPicker
		property parent : base_picker(caller)
		
		on run
			return continue run
		end run
		
		on finder_selection()
			--log "start finder_selection of ItemPicker"
			set a_list to continue finder_selection()
			if my _delegate's use_insertion_location() and (a_list is {}) then
				tell application "Finder"
					set a_list to {insertion location}
				end tell
				set my _is_insertion_location to true
			end if
			if length of a_list is 1 then
				set a_list to remove_special(a_list)
			end if
			--log "end finder_selection of ItemPicker"
			return a_list
		end finder_selection
		
		on match_class(an_item)
			return true
		end match_class
		
		on is_match(an_item)
			if not match_class(an_item) then return false
			
			tell my _delegate
				return (match_suffix(an_item) or match_type(an_item))
			end tell
		end is_match
		
	end script
end picker_for_item

on picker_for_application(caller)
	script ApplicationPicker
		property parent : base_picker(caller)
		
		on run
			return continue run
		end run
		
		on is_match(an_item)
			tell application "Finder"
				return class of an_item is application file
			end tell
		end is_match
	end script
end picker_for_application

on picker_for_folder(caller)
	script FolderPicker
		property parent : base_picker(caller)
		
		on run
			return continue run
		end run
		
		on finder_selection()
			set a_list to continue finder_selection()
			if my _delegate's use_insertion_location() and (a_list is {}) then
				tell application "Finder"
					set a_list to {insertion location}
				end tell
				set my _is_insertion_location to true
			end if
			
			if length of a_list is 1 then
				set a_list to remove_special(a_list)
			end if
			return a_list
		end finder_selection
		
		on match_class(an_item)
			tell application "Finder"
				return class of an_item is folder
			end tell
		end match_class
		
		on is_match(an_item)
			return (match_class(an_item) and my _delegate's match_suffix(an_item))
		end is_match
	end script
end picker_for_folder

on picker_for_disk(caller)
	script DiskPicker
		property parent : picker_for_folder(caller)
		
		on run
			return continue run
		end run
		
		on match_class(an_item)
			tell application "Finder"
				return class of an_item is disk
			end tell
		end match_class
		
	end script
end picker_for_disk

on picker_for_container(caller)
	script ContainerPicker
		property parent : picker_for_folder(caller)
		
		on run
			return continue run
		end run
		
		on match_class(an_item)
			tell application "Finder"
				return class of an_item is in {folder, disk}
			end tell
		end match_class
		
	end script
end picker_for_container

on picker_for_document(caller)
	script DocumentPicker
		property parent : picker_for_item(caller)
		
		on run
			return continue run
		end run
		
		on match_class(an_item)
			tell application "Finder"
				return (class of an_item is document file)
			end tell
		end match_class
		
	end script
end picker_for_document

on picker_for_package(caller)
	script PackagePicker
		property parent : picker_for_item(caller)
		
		on is_match(an_item)
			if continue is_match(an_item) then
				return package folder of (info for (an_item as alias))
			end if
		end is_match
	end script
end picker_for_package

property _picker : picker_for_item(me)

(** public handlers **)

(*!@group Constructor 
まずは、Finder から取得したいファイル/フォルダの種類に応じたインスタンスを生成します。
*)

on make
	set a_parent to me
	script FinderSelection
		property parent : a_parent
		property _picker : missing value
		property _chooser : missing value
		property _typeList : my _typeList
		property _suffixList : my _suffixList
		property _defaultLocation : my _defaultLocation
		property _promptMessage : my _promptMessage
		property _withResolveAlias : my _withResolveAlias
		property _targetApplication : my _targetApplication
		property _useInsertionLocation : my _useInsertionLocation
		property _useChooser : my _useChooser
		property _allow_myself : my _allow_myself
	end script
	
	return FinderSelection
end make

(*!
@abstruct Finder で選択されているファイル/フォルダをすべて取得するオブジェクトを生成します。
@result FinderSelection のインスタンス
*)
on make_for_item()
	set self to make
	return self's setup_for_item()
end make_for_item

(*!
@abstruct 選択されているものの中から、ファイルを取得するオブジェクトを生成します。
@result FinderSelection のインスタンス
*)
on make_for_file()
	set self to make
	return self's setup_for_file()
end make_for_file

(*!
@abstruct 選択されているものの中から、書類ファイルを取得するオブジェクトを生成します。
@result FinderSelection のインスタンス
*)
on make_for_document()
	set self to make
	return self's setup_for_document()
end make_for_document

(*!
@abstruct 選択されているものの中から、アプリケーションを取得するオブジェクトを生成します。
@result FinderSelection のインスタンス
*)
on make_for_application()
	set self to make
	return self's setup_for_application()
end make_for_application

(*!
@abstruct 選択されているものの中から、パッケージを取得するオブジェクトを生成します。
@result script object : FinderSelection のインスタンス
*)
on make_for_package()
	set self to make
	return self's setup_for_package()
end make_for_package

(*!
@abstruct 選択されているものの中から、ディスクもしくはフォルダを取得するオブジェクトを生成します。
@result FinderSelection のインスタンス
*)
on make_for_container()
	set self to make
	return self's setup_for_container()
end make_for_container

(*!
@abstruct 選択されているものの中から、フォルダを取得するオブジェクトを生成します。
@result FinderSelection のインスタンス
*)
on make_for_folder()
	set self to make
	return self's setup_for_folder()
end make_for_folder

(*!
@abstruct 選択されているものの中から、ディスクを取得するオブジェクトを生成します。
@result FinderSelection のインスタンス
*)
on make_for_disk()
	set self to make
	return self's setup_for_disk()
end make_for_disk

(*!@group Getting Finder's Selection 

@abstruct Finder で選択されている項目を取得します。
@result list of alias　 : 選択項目の取得に失敗したら missing value が返ります。
*)
on get_selection()
	--log "start get_selection"
	local a_list, an_item, n_select
	set a_list to run my _picker
	--log "after run picker in get_selection"
	set n_select to length of a_list
	if n_select is 0 then
		if my _useChooser then
			--log "before run chooser in get_selection"
			set a_list to run my _chooser
		else
			set a_list to missing value
		end if
	else if (not my _allow_myself) and (n_select is 1) then
		set a_list to except_myself(item 1 of a_list)
	end if
	return a_list
end get_selection

(*!@group Accessor Methods 

FinderSelection のインスタンスの動作をカスタマイズします。よく使う method は次の ３つだと思います。

* ((<set_types>))
* ((<set_extensions>))
* ((<set_prompt_message>))
*)

(*!
@abstruct　取得したいファイルのファイルタイプを設定します。
@param type_list (list) : ファイルタイプのリスト ex) {"TEXT", "PDF "}
@result script object : me
*)
on set_types(type_list)
	set my _typeList to type_list
	if my _suffixList is missing value then
		set my _suffixList to {}
	end if
	return me
end set_types

(*!
@abstruct　取得したいファイル/フォルダの拡張子を設定します。
@param extenstion_list (list) : 拡張子のリスト ex) {".rtf", ".pdf"}
@result script object : me
*)
on set_extensions(extension_list)
	set my _suffixList to extension_list
	if my _typeList is missing value then
		set my _typeList to {}
	end if
	return me
end set_extensions

(*!
@abstruct ファイル/フォルダ選択ダイアログで表示されるメッセージ
@param a_message (Unicode text or string)
@result script object : me
*)
on set_prompt_message(a_message)
	set my _promptMessage to a_message
	return me
end set_prompt_message

(*!
@abstruct Finder で選択項目が無い場合、 ファイル/フォルダ選択ダイアログを開くかどうか。
@description false を設定すると、ファイル/フォルダ選択ダイアログを開きません。
デフォルトでは　true が設定されています。
@param a_bool (boolean) : ファイル/フォルダ選択ダイアログを開くかどうか。
@result script object : me
*)
on set_use_chooser(a_bool)
	set my _useChooser to a_bool
	return me
end set_use_chooser

(*!
@abstruct
Finder で選択項目が無い場合、 選択されている場所を取得するかどうか。
@description 
「選択されている場所」とは、Finder でメニュー「新規フォルダ」でフォルダが作られる場所です。

フォルダを取得する可能性があるインスタンス（((<make_for_item>)) や ((<make_for_folder>)) などで生成）の場合のみに効果があります。

デフォルトでは false が設定されています。
@param a_bool (boolean) : 選択されている場所を所得するかどうか。
@result script object : me
*)
on set_use_insertion_location(a_bool)
	set my _useInsertionLocation to a_bool
	return me
end set_use_insertion_location

on use_insertion_location()
	return my _useInsertionLocation
end use_insertion_location

(*!
@abstruct
Finder で自分自身（スクリプトファイルやアプリケーション）が選択されている場合、選択項目に含めるかどうか。
@description
デフォルトでは false が設定されています。
@param a_bool (boolean)
@result script object : me
*)
on set_allow_myself(a_bool)
	set my _allow_myself to a_bool
	return me
end set_allow_myself

on allow_myself()
	return my _allow_myself
end allow_myself

(*!
@abstruct エイリアスファイルが Finder で選択されている時に、そのオリジナルを求めるかどうか
@description false を設定すると、オリジナルを求めません。デフォルトでは true が設定されています。
@param a_bool (boolean)
@result script object : me
*)
on set_resolve_alias(a_bool)
	set my _withResolveAlias to a_bool
	return me
end set_resolve_alias

(*!
@abstruct Finder で選択項目が無い場合に開かれるファイル/フォルダ選択ダイアログの最初の場所
@param a_location (a reference) : フォルダへの参照
@param a_bool (boolean)
@result script object : me
*)
on set_default_location(a_location)
	set my _defaultLocation to a_location as alias
	return me
end set_default_location

(*----
@abstruct Finder　で選択項目が無い場合に実行するスクリプトを設定します。
@description 設定したスクリプトの返り値が get_selection の返り値になります。デフォルトでは自動的にファイル/フォルダ選択ダイアログを開くスクリプトが設定されます。多くの場合、カスタムに与える必要はないです。
@param a_script (script object)
@result script object : me
*)
on set_chooser(a_script)
	set my _chooser to a_script
	return me
end set_chooser

on set_chooser_for_folder()
	set my _chooser to chooser_for_folder(me)
	return me
end set_chooser_for_folder

on set_chooser_for_file()
	set my _chooser to chooser_for_file(me)
	return me
end set_chooser_for_file

on current_picker(a_script)
	return my _picker
end current_picker

on set_picker(a_script)
	set my _picker to a_script
end set_picker


(*!@group Setup Kind Items to Pick Up 

取得するファイル/フォルダの種類を設定します。Constructor　の中で実行されるので、通常は使う必要がないはずです。インスタンスを生成後、取得する項目の種類を変えたいときに使えます。
*)


(*!
@abstruct すべてのファイル/フォルダを対象とします。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_item()
	set my _picker to picker_for_item(me)
	set my _chooser to chooser_for_file(me)
	return me
end setup_for_item

(*!
@abstruct 取得する項目をファイルだけに制限します。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_file()
	set my _picker to picker_for_file(me)
	set my _chooser to chooser_for_file(me)
	return me
end setup_for_file

(*!
@abstruct 取得する項目を書類ファイルだけに制限します。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_document()
	set my _picker to picker_for_document(me)
	set my _chooser to chooser_for_file(me)
	return me
end setup_for_document

(*!
@abstruct 取得する項目をアプリケーションファイルだけに制限します。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_application()
	set my _picker to picker_for_application(me)
	set my _chooser to chooser_for_file(me)
	return me
end setup_for_application

(*!
@abstruct 取得する項目をパッケージだけに制限します。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_package()
	set my _picker to picker_for_package(me)
	set my _chooser to chooser_for_file(me)
	return me
end setup_for_package

(*!
@abstruct 取得する項目をコンテナ（フォルダもしくはディスク）だけに制限します。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_container()
	set my _picker to picker_for_container(me)
	set my _chooser to chooser_for_folder(me)
	return me
end setup_for_container

(*!
@abstruct 取得する項目をフォルダだけに制限します。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_folder()
	set my _picker to picker_for_folder(me)
	set my _chooser to chooser_for_folder(me)
	return me
end setup_for_folder

(*!
@abstruct 取得する項目をディスクだけに制限します。
@result a reference : FinderSelection のインスタンス
*)
on setup_for_disk()
	set my _picker to picker_for_disk(me)
	set my _chooser to chooser_for_folder(me)
	if my _defaultLocation is missing value then
		set_default_location(POSIX file (get "/"))
	end if
	return me
end setup_for_disk

(*!@group Utility Handlers *)

(*!
@abstruct ファイルが path to me で得られる項目と同じ物がどうか調べます。
@param an_item : ファイルリファレンス
@result boolean : an_item が path to me と一致したら true
*)
on is_same_to_me(an_item)
	return (canon_path(path to me) is canon_path(an_item))
end is_same_to_me

(*= private handlers  *)

(*== delegate of picker script *)

on match_type(an_item)
	if my _typeList is in missing value then
		return true
	end if
	
	if my _typeList is {} then
		return false
	end if
	
	--return (file type of (info for (an_item as alias) without size)) is in my _typeList
	tell application "Finder"
		try
			return (file type of an_item is in my _typeList)
		on error
			return false
		end try
	end tell
end match_type

on match_suffix(an_item) -- an_path must be unicode text
	if my _suffixList is missing value then
		return true
	end if
	
	if my _suffixList is {} then
		return false
	end if
	
	set a_result to false
	set a_path to an_item as Unicode text
	if a_path ends with ":" then
		set a_path to text 1 thru -2 of a_path
	end if
	repeat with a_suffix in my _suffixList
		if (a_path ends with a_suffix) then
			set a_result to true
			exit repeat
		end if
	end repeat
	
	return a_result
end match_suffix

on resolve_alias(an_item)
	tell application "Finder"
		if my _withResolveAlias and (class of an_item is alias file) then
			try
				set an_item to original item of an_item
			end try
		end if
	end tell
	return an_item
end resolve_alias

(*== othres *)
on canon_path(an_item)
	set a_path to POSIX path of an_item
	if (a_path is not "/") and (a_path ends with "/") then
		set a_path to text 1 thru -2 of a_path
	end if
	return a_path
end canon_path

on is_same_path(item1, item2)
	return (canon_path(item1) is canon_path(item2))
end is_same_path

on except_myself(an_item)
	if is_same_to_me(an_item) then
		if my _useChooser then
			--log "before run chooser in except_myself"
			return run my _chooser
		else
			return missing value
		end if
	else
		return {an_item}
	end if
end except_myself

on debug()
	boot (module loader) for me
	--set item_picker to make_for_folder()
	set item_picker to make_for_item()
	tell item_picker
		set_chooser_for_folder()
		set_prompt_message("Choose a disk of a disk image")
		set_use_insertion_location(true)
		set a_list to get_selection()
	end tell
	--log a_list
	return a_list
end debug

on debug_folder()
	boot (module loader) for me
	--tell make_for_container()
	tell make_for_folder()
		--set_prompt_message("Choose text file or PDF file.")
		--set_types({"TEXT", "PDF "})
		--set_extensions({"tion", ".pdf"})
		log "before set_use_insertion_location : " & (_useInsertionLocation of it)
		set_use_insertion_location(true)
		log "after set_use_insertion_location : " & (_useInsertionLocation of it)
		get_selection()
	end tell
end debug_folder

on debug_document()
	tell make_for_document()
		set_prompt_message("Choose text file or PDF file.")
		--set_resolve_alias(false)
		log get_selection()
	end tell
end debug_document

on run
	--return debug()
	--return debug_folder()
	--return debug_document()
	try
		show helpbook (path to me) with recovering InfoPlist
	on error msg number errno
		display alert (msg & return & errno)
	end try
end run

