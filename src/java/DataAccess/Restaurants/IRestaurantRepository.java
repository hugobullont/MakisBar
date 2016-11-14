/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Restaurants;

import Entities.Restaurants;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface IRestaurantRepository {
    List<Restaurants> GetAllRestaurants ();
}
