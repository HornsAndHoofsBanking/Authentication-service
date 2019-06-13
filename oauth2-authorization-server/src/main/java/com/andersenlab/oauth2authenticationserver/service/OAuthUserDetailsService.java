package com.andersenlab.oauth2authenticationserver.service;

import com.andersenlab.oauth2authenticationserver.dao.UserDetailsDao;
import com.andersenlab.oauth2authenticationserver.domain.OAuthUserDetails;
import com.andersenlab.oauth2authenticationserver.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountStatusUserDetailsChecker;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service ("userDetailsService")
public class OAuthUserDetailsService implements UserDetailsService {

    @Autowired
    private UserDetailsDao userDetailsDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        //Optional<User> userOptional = userDetailsDao.findByUsername(username);
        Optional<User> userOptional = userDetailsDao.findById(Integer.valueOf(username));
        userOptional.orElseThrow(() -> new UsernameNotFoundException("User with id: " + username + " not found."));

        UserDetails userDetails = new OAuthUserDetails(userOptional.get());

        new AccountStatusUserDetailsChecker().check(userDetails);

        return userDetails;
    }
}
