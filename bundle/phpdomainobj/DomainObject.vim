" Vim global pluggin for generating DomainObject data from class parameters
" Author: Maciek  Ruckgaber <maciekrb@gmail.com>
" Version: 0.1
" Description:
" Creates getters/setters for Domain objects based on class properties

if exists("loaded_buildmethods")
  finish
endif
let loaded_buildmethods = 1

if !hasmapto('<Plug>BuildMethods')
  map <unique> <Leader>bm <Plug>BuildMethods
  map <unique> <Leader>bmm <Plug>BuildMapper
endif
noremap <unique> <script> <Plug>BuildMethods <SID>BuildMethods
noremap <SID>BuildMethods :call <SID>BuildMethods()<CR>
noremap <unique> <script> <Plug>BuildMapper <SID>BuildMapper
noremap <SID>BuildMapper :call <SID>BuildMapper()<CR>

function s:BuildMethods() range
  let lnum = a:firstline
  let content = ['  public function get%s()', '  {', '    return $this->%s;', '  }', '  public function set%s(%s)', '  {', '    $this->%s = %s;', '  }']
  
  call  append(line('$')-1,'')
  call  append(line('$')-1,'  public function __construct($id=null)')
  call  append(line('$')-1,'  {')
  call  append(line('$')-1,'    parent::__construct($id);')
  call  append(line('$')-1,'  }')
  call  append(line('$')-1,'')

  while lnum <= a:lastline
    let line = split(getline(lnum))
    let cl = content
    let ln = substitute(line[1],"[$;]","","g")
    let cc = substitute(ln,'\(.*\)','\u\1','g')
    call append(line('$')-1, printf(cl[0],cc))
    call append(line('$')-1,cl[1])
    call append(line('$')-1,printf(cl[2],ln))
    call append(line('$')-1,cl[3])
    call append(line('$')-1,'')
    call append(line('$')-1,printf(cl[4],cc,'$'.ln))
    call append(line('$')-1,cl[5])
    call append(line('$')-1,printf(cl[6],ln,'$'.ln))
    call append(line('$')-1,cl[7])
    let lnum = lnum + 1
  endwhile
  call indent(line(8))
endfunction

function s:BuildMapper()

  let text = ["  protected $_name = '__tbl_name__';", "  protected $_primaryKey = '__tbl_primary_key';", "", "  public function __construct()", "  {", "    parent::__construct(Zend_Registry::get('db'));", "  }", "", "  public function find($id)", "  {", "    $select = $this->db->select()->from(array('x' => $this->_name))", "                                 ->where('x.__tbl_primary_key = ?',$id);", "", "    $reg = $this->loadOne($select);", "    return $reg;", "  }", "", "  public function findAll($pageSize=null,$pageNum=0,$order=null)", "  {", "    $select = $this->db->select()->from(array('x' => $this->_name),", "                                        array(new Zend_Db_Expr('SQL_CALC_FOUND_ROWS x.*')));", "", "    if(!is_null($order))", "      $select->order($order);", "", "    $regs = $this->loadCollection($select,$pageSize,$pageNum);", "    return $regs;", "  }", "", "  public function loadObject($row)", "  {", "    $obj = new __class_name__($row['__tbl_primary_key']);", "    return $obj;", "  }", "", "  public function doInsert(DomainObject $obj)", "  {", "    $data = array('__tbl_primary_key' => $obj->getId(),", "                  '' => $obj->getMNAME(),", "                 );", "", "    $this->db->insert($this->_name,$data);", "  }", "", "  public function doUpdate(DomainObject $obj)", "  {", "    $data = array('' => $obj->getMNAME(),", "                  '' => $obj->getMNAME(),", "                 );", "", "    $where = $this->db->quoteInto('__tbl_primary_key = ?',$obj->getId());", "    $this->db->update($this->_name,$data,$where);", "  }", "", "  public function doDelete(DomainObject $obj)", "  {", "    $where = $this->db->quoteInto('__tbl_primary_key = ?',$obj->getId());", "    $this->db->delete($this->_name,$where);", "  }"]
  
  for ln in text
    call append(line('$')-1,ln)
  endfor

endfunction
