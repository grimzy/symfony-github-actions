<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class StatusController extends AbstractController
{
    private const STATUS_OK = 'ok';

    /**
     * @Route("/status", name="status", format="json")
     */
    public function index()
    {
        return new JsonResponse(['status' => self::STATUS_OK]);
    }
}
