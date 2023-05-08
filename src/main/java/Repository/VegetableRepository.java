/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Repository;

import Entities.Vegetable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author kusod
 */
@Repository
public interface VegetableRepository extends CrudRepository<Vegetable, Integer> {

    @Query(value = "SELECT Vegetable.*, Category.Name FROM Vegetable INNER JOIN Category ON Vegetable.CatagoryID = Category.CatagoryID WHERE Vegetable.CatagoryID = ?1", nativeQuery = true)
    Iterable<Vegetable> getVegetablesByCategory(String id);

//    @Query(value = "select * from vegetable v, category c where c.CatagoryID = v.CatagoryID "
//            + "and v.Vegetable_Name LIKE %?1%", nativeQuery = true)
    @Query(value = "select v.*, c.Name from vegetable v\n"
            + "inner join category c on c.CatagoryID = v.CatagoryID\n"
            + "where v.Vegetable_Name LIKE %?1%", nativeQuery = true)
    Iterable<Vegetable> getVegetableByNameforSearching(String name);

    @Query(value = "SELECT v.*, c.Name from Vegetable v inner join category c on c.CatagoryID = v.CatagoryID where v.CatagoryID= ?1 and v.Vegetable_Name like %?2%", nativeQuery = true)
    Iterable<Vegetable> getVegetableByCategoryAndNameforSearching(String id, String name);
//    @Query(value = "select * from vegetable v, category c where  "
//            + "c.CatagoryID = v.CatagoryID and VegetableID = ?1", nativeQuery = true)

    @Query(value = "SELECT * FROM Vegetable WHERE Vegetable.vegetableID = ?1", nativeQuery = true)
    Vegetable getVegetableByID(String id);

}
