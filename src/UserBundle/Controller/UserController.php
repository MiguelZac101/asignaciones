<?php

namespace UserBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\HttpFoundation\Request;//sirve para recibir peticion
use Symfony\Component\HttpFoundation\Response;

use UserBundle\Entity\User;//Modelo
use UserBundle\Form\UserType;

class UserController extends Controller
{
    public function indexAction(Request $request){
        $em = $this->getDoctrine()->getManager();
        /*
        $users = $em->getRepository('UserBundle:User')->findAll();
        $res = "Lista de usuarios: <br/>";
        
        foreach($users as $user){
$res.= "usuario: ".$user->getUsername()." - Email:".$user->getEmail()."<br/>";
        }
        */
        //return new Re sponse($res);
        $dql = "SELECT u FROM UserBundle:User u";
        $users = $em->createQuery($dql);
        
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
                $users, $request->query->getInt('page',1),3
        );
        
        return $this->render("UserBundle:User:index.html.twig",array('pagination'=>$pagination));        
    }
    
    public function addAction(){
        $user =new User();
        $form = $this->createCreateForm($user);
        return $this->render('UserBundle:User:add.html.twig',array('form' => $form->createView()));
    }
    
    private function createCreateForm(User $entity){
        $form = $this->createForm(new UserType(),$entity,array(
            'action' => $this->generateUrl('user_create'),
            'method' => 'POST'
        ));
        return $form;
    }
    
    public function createAction(Request $request){
        $user = new User();
        $form = $this->createCreateForm($user);
        $form->handleRequest($request);
        
        if($form->isValid()){
           /*
            $password = $form->get('password')->getData();
            $encoder = $this->container->get('security.encoder_factory');
            $encoded = $encoder->encodePassword($user,$password);
            $user->setPassword($encoded);            
            */
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();
            
            $successMessage = $this->get('translator')->trans('The user has been created.');
            $this->get('session')->getFlashBag()->add('mensaje',$successMessage);
            
            //return $this->redirectToRoute('user_index');
            return $this->redirect($this->generateUrl('user_index'));
        }
        
        return $this->render('UserBundle:User:add.html.twig',array('form' => $form->createView()));
    }
    
    public function viewAction($id){
        $repository = $this->getDoctrine()->getRepository('UserBundle:User');
        $user = $repository->find($id);
        return new Response("usuario: ".$user->getUsername()." - Email:".$user->getEmail());
    }
}
