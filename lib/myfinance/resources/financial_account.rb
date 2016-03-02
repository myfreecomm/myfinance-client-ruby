module Myfinance
  module Resources
    class FinancialAccount < Base

      def initialize(http)
        @http = http
        set_method_for(pay_or_receive_method)
        set_method_for(undo_payment_or_receivement)
      end

      #
      # List a payables/receivables account
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>GET /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#get_index
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#get_index
      #
      def find_all(entity_id)
        endpoint = parameterize_endpoint(nil, entity_id, __method__)
        http.get(endpoint, body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Generate a empty object from payables/receivables account
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/payable_accounts/new</tt>
      #   Method: <tt>GET /entities/:entity_id/receivable_accounts/new</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#get_new
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#get_new
      #
      def get_new(entity_id)
        endpoint = parameterize_endpoint(nil, entity_id, __method__)
        http.get(endpoint, body: {}) do |response|
          respond_with_object(response, resource_key)
        end
      end

      #
      # Creates a payable/receivable account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>POST /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#post_create
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#post_create
      #
      def create(entity_id, params = {})
        request_and_build_response(:post, parameterize_endpoint(nil, entity_id, __method__), params)
      end

      #
      # Updates a payable/receivable account
      #
      # [API]
      #   Method: <tt>PUT /entities/:entity_id/payable_accounts/:id</tt>
      #   Method: <tt>PUT /entities/:entity_id/receivable_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#put_update
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#put_update
      #
      def update(id, entity_id, params = {})
        request_and_build_response(:put, parameterize_endpoint(id, entity_id, __method__), params)
      end

      #
      # Destroys a payable/receivable account
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/payable_accounts/:id</tt>
      #   Method: <tt>DELETE /entities/:entity_id/receivable_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#delete_destroy
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#delete_destroy
      #
      def destroy(id, entity_id)
        http.delete(parameterize_endpoint(id, entity_id, __method__)) do |response|
          true
        end
      end

      #
      # Create as recurrent payable/receivable account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>POST /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#post_create_as_recurrent
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#post_create_as_recurrent
      #
      def create_as_recurrent(entity_id, params = {})
        request_and_build_response(:post, parameterize_endpoint(nil, entity_id, __method__), params)
      end

      #
      # Create as parcelled payable/receivable account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>POST /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#post_create_as_parcelled
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#post_create_as_parcelled
      #
      def create_as_parcelled(entity_id, params = {})
        request_and_build_response(:post, parameterize_endpoint(nil, entity_id, __method__), params)
      end

      #
      # Destroy a recorrent payable/receivable account
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/payable_accounts/:id/recurrence</tt>
      #   Method: <tt>DELETE /entities/:entity_id/receivable_accounts/:id/recurrence</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#delete_destroy_as_recurrent
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#delete_destroy_as_recurrent
      #
      def destroy_as_recurrent(id, entity_id)
        http.delete(parameterize_endpoint(id, entity_id, __method__)) do |response|
          true
        end
      end

      #
      # Destroy many payable/receivable accounts
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>DELETE /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#delete_destroy_many
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#delete_destroy_many
      #
      def destroy_many(entity_id, params)
        http.delete(parameterize_endpoint(nil, entity_id, __method__), body: params) do |response|
          true
        end
      end

      private

      def request_and_build_response(method, endpoint, params={})
        http.send(method, endpoint, body: { resource_key => params }) do |response|
          respond_with_object(response, resource_key)
        end
      end

      def default_endpoints
        {
          find_all: "/entities/:entity_id/#{resource_key}s",
          get_new: "/entities/:entity_id/#{resource_key}s/new",
          create: "/entities/:entity_id/#{resource_key}s",
          update: "/entities/:entity_id/#{resource_key}s/:id",
          destroy: "/entities/:entity_id/#{resource_key}s/:id",
          create_as_recurrent: "/entities/:entity_id/#{resource_key}s",
          create_as_parcelled: "/entities/:entity_id/#{resource_key}s",
          destroy_as_recurrent: "/entities/:entity_id/#{resource_key}s/:id/recurrence",
          destroy_many: "/entities/:entity_id/#{resource_key}s",
        }
      end

      def parameterize_endpoint(id, entity_id, key)
        endpoints[key.to_sym].gsub(':entity_id', entity_id.to_s).gsub(':id', id.to_s)
      end

      def set_method_for(action)
        self.class.send(:define_method, action) do |id, entity_id, params={}|
          request_and_build_response(:put, parameterize_endpoint(id, entity_id, action), params)
        end
      end
    end
  end
end
