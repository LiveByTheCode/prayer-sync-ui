#!/bin/bash

# Test authentication endpoints

BASE_URL="http://localhost:8080/api"

echo "Testing Prayer Sync Authentication API"
echo "======================================"

# Test registration
echo -e "\n1. Testing Registration..."
REGISTER_RESPONSE=$(curl -s -X POST "$BASE_URL/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "testpass123",
    "displayName": "Test User"
  }')

if [ $? -eq 0 ]; then
  echo "Registration response: $REGISTER_RESPONSE"
  TOKEN=$(echo $REGISTER_RESPONSE | grep -o '"token":"[^"]*' | cut -d'"' -f4)
  if [ ! -z "$TOKEN" ]; then
    echo "✓ Registration successful! Token received."
  else
    echo "✗ Registration failed or returned unexpected response."
  fi
else
  echo "✗ Could not connect to server. Is the backend running on port 8080?"
fi

# Test login
echo -e "\n2. Testing Login..."
LOGIN_RESPONSE=$(curl -s -X POST "$BASE_URL/auth/login" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "testpass123"
  }')

if [ $? -eq 0 ]; then
  echo "Login response: $LOGIN_RESPONSE"
  TOKEN=$(echo $LOGIN_RESPONSE | grep -o '"token":"[^"]*' | cut -d'"' -f4)
  if [ ! -z "$TOKEN" ]; then
    echo "✓ Login successful! Token received."
    
    # Test authenticated endpoint
    echo -e "\n3. Testing authenticated endpoint (get current user)..."
    USER_RESPONSE=$(curl -s -X GET "$BASE_URL/users/me" \
      -H "Authorization: Bearer $TOKEN")
    echo "User profile response: $USER_RESPONSE"
    
    if echo "$USER_RESPONSE" | grep -q "email"; then
      echo "✓ Successfully retrieved user profile!"
    else
      echo "✗ Failed to retrieve user profile."
    fi
  else
    echo "✗ Login failed or returned unexpected response."
  fi
else
  echo "✗ Could not connect to server."
fi

echo -e "\n======================================"
echo "Test completed."