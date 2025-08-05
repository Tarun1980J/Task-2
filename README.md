It shows you the details about how to insert data into the tables in the schema that we created previous day.

| **Type** | **Command**                                     | **Auto Commit?** | **Explanation**                                                                                                                   |
| -------- | ----------------------------------------------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **DDL**  | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME` | ✅ Yes            | DDL statements are **auto-committed**. Changes are saved permanently as soon as the statement executes successfully. No rollback. |
| **DML**  | `INSERT`, `UPDATE`, `DELETE`, `MERGE`           | ❌ No             | DML changes are **not saved** until an explicit `COMMIT` is issued. You can `ROLLBACK` before commit to undo changes.             |
