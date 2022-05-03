select  rt.rn,
        rt.title,
        rt.content,
        rt.hit,
        rt.regDate,
        rt.userNo,
        rt.userName
        
      
from (select  rownum rn,
              ot.title,
              ot.content,
              ot.hit,
              ot.regDate,
              ot.userNo,
              ot.userName
      from (select    b.no,
                      b.title,
                      b.content,
                      b.hit,
                      to_char(b.reg_date, 'YYYY-MM-DD HH:MI:SS') regDate,
                      b.user_no userNo,
                      u.name userName
            from board b, users u
            where b.user_no = u.no
            order by b.no desc
            ) ot
      )rt
where rn >=11
and rn<=20;


select count(*)
from board b, users u
where b.user_no = u.no;