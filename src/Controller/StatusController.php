<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StatusController extends AbstractController
{
    private const STATUS_OK = 'ok';

    /**
     * @Route("/status", name="status", format="json")
     */
    public function index(): Response
    {
        return new JsonResponse(['status' => self::STATUS_OK]);
    }
}
