package com.example.latera.repositories.game;

import com.example.latera.models.game.DgCountModel;
import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface DgCountRepository extends JpaRepository<DgCountModel, Integer> {


    //busca top 5 DG
    @Query(nativeQuery = true, value = "  select top (5) dg.userDbId, dg.continentId, dg.clearCount, u.userName, u.class, CASE WHEN dg.clearCount >= 10 THEN 'Skilled' ELSE 'Rookie' END AS dgStatus " +
            "from DungeonClearCount AS dg LEFT JOIN Users AS u ON dg.userDbId = u.userDbId " +
            "WHERE dg.continentId = :continentId ORDER BY dg.clearCount DESC")
    List<DgCountModel> findTopUsersClearByDgId (@Param(value = "continentId") Integer continentId);

    //busca top 5 todas DGs
    @Query(nativeQuery = true, value = "SELECT TOP(5) dg.userDbId, 0 AS continentId, SUM(dg.clearCount) AS clearCount, u.userName, u.class, '' AS dgStatus " +
            "from DungeonClearCount AS dg LEFT JOIN Users AS u  ON dg.userDbId = u.userDbId " +
            "WHERE dg.continentId IN (9916, 9027, 3126, 3203)  " +
            "GROUP BY dg.userDbId, u.userName, u.class ORDER BY clearCount DESC")
    List<DgCountModel> findTopAllUsersAllDgs ();


    //busca total de clear do usuário en determinada DG
    @Query(nativeQuery = true, value = "SELECT dg.userDbId, dg.continentId, dg.clearCount,  u.userName, u.class, CASE WHEN dg.clearCount >= 10 THEN 'Skilled' ELSE 'Rookie' END AS dgStatus " +
            "from DungeonClearCount AS dg LEFT JOIN Users AS u  ON dg.userDbId = u.userDbId " +
            "WHERE dg.continentId = :continentId AND u.userName = :userName")
    List<DgCountModel> findDgClearCountByNameAndDgId (@Param(value = "userName") String userName, @Param(value = "continentId") Integer continentId);


    //busca total de clears nas dgs end game pelo nome do usuário
    @Query(nativeQuery = true, value =
            "SELECT dg.userDbId, 0 AS continentId, SUM(dg.clearCount) AS clearCount, u.userName, u.class, '' AS dgStatus " +
                    "from DungeonClearCount AS dg LEFT JOIN Users AS u  ON dg.userDbId = u.userDbId " +
                    "WHERE dg.continentId IN (9916, 9027, 3126, 3203) AND u.userName = :userName " +
                    "GROUP BY dg.userDbId, u.userName, u.class")
    List<DgCountModel> findAllDgsClearCountByName(@Param(value = "userName") String userName);

}
